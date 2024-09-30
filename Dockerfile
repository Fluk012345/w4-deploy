FROM node:20 AS base

### <JANGAN DIGANTI>
ARG STUDENT_NAME
ARG STUDENT_NIM

ENV NUXT_STUDENT_NAME ${STUDENT_NAME}
ENV NUXT_STUDENT_NIM ${STUDENT_NIM}
### </JANGAN DIGANTI>

# TODO: code disini
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

# Copy package and lock file
COPY package.json pnpm-lock.yaml* ./

# Install dependencies
RUN pnpm install

# Copy the rest of the application files
COPY . .

# Build the project
RUN pnpm build
EXPOSE 3000
# Jalankan aplikasi
CMD ["pnpm","dev"]