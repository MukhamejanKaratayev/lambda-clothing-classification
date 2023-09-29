FROM public.ecr.aws/lambda/python:3.8-x86_64

COPY tflite_runtime-2.7.0-cp38-cp38-linux_x86_64.whl .

RUN pip install keras-image-helper
RUN pip install tflite_runtime-2.7.0-cp38-cp38-linux_x86_64.whl

COPY clothing-model.tflite .
COPY lambda_function.py .

CMD [ "lambda_function.lambda_handler" ]