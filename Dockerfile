FROM debian:bullseye

# 必要なパッケージをインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-venv \
        make \
        bash \
        texlive-full \
        latexmk \
        unzip \
        curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# latexminted を仮想環境にインストール
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install latexminted

# latexminted を使えるように PATH に追加
ENV PATH="/opt/venv/bin:$PATH"

# 作業ディレクトリ（docker-compose と一致）
WORKDIR /workdir
