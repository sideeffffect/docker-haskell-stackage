## Dockerfile for a haskell environment, with lts stackage
FROM       haskell:7.8
MAINTAINER Ondra Pelech <ondra.pelech@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y bash wget coreutils tar xz-utils make libgmp-dev gzip curl zlib1g-dev
RUN apt-get install -y freeglut3-dev libblas-dev libbz2-dev libcairo2-dev libglib2.0-dev libgsl0-dev libicu-dev liblapack-dev libmysqlclient-dev libncurses5-dev libpango1.0-dev libpcre3-dev libpq-dev libtinfo-dev libxrandr-dev libxss-dev libzmq3-dev llvm llvm-dev nettle-dev opt pkg-config
RUN cabal info
RUN wget -q -O - "https://www.stackage.org/lts/cabal.config?global=true" >> /root/.cabal/config
RUN cabal update
RUN cabal install array async attoparsec base bytestring case-insensitive containers deepseq directory extensible-exceptions fgl filepath GLURaw GLUT hashable haskell2010 haskell98 hpc hscolour html HTTP HUnit mtl network old-locale old-time OpenGL OpenGLRaw parallel parsec pretty primitive process QuickCheck random regex-base regex-compat regex-posix split stm syb template-haskell text time transformers unix unordered-containers vector xhtml zlib

## run ghci by default unless a command is specified
CMD ["ghci"]

