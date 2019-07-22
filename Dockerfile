# Copyright 2019 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM golang:1.12.7
WORKDIR /tmp
RUN curl -L https://dl.k8s.io/v1.14.4/kubernetes-client-linux-amd64.tar.gz | tar xvz
RUN mv /tmp/kubernetes/client/bin/kubectl /usr/local/bin
RUN curl https://get.docker.com | sh
COPY capd-manager /usr/local/bin

ENTRYPOINT ["capd-manager"]
