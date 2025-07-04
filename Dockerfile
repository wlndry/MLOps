FROM tensorflow/serving:latest

# Salin model ke direktori yang dikenali oleh TF Serving
COPY ./output/serving_model /models/cc-model

# Salin file prometheus.config ke dalam container
COPY ./config/prometheus.config /model_config/prometheus.config

# Set environment variable
ENV MODEL_NAME=cc-model
ENV MODEL_BASE_PATH=/models
ENV MONITORING_CONFIG=/model_config/prometheus.config
ENV PORT=8501

# Buat entrypoint script
RUN echo '#!/bin/bash \n\n\
env \n\
tensorflow_model_server --port=8500 --rest_api_port=${PORT} \
--model_name=${MODEL_NAME} --model_base_path=${MODEL_BASE_PATH}/${MODEL_NAME} \
--monitoring_config_file=${MONITORING_CONFIG} \
"$@"' > /usr/bin/tf_serving_entrypoint.sh && \
chmod +x /usr/bin/tf_serving_entrypoint.sh

# Gunakan entrypoint
ENTRYPOINT ["/usr/bin/tf_serving_entrypoint.sh"]
