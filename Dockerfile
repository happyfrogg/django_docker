FROM python:3.12

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /code

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput

# cmd 창에서 작성할 내용을 띄어쓰기 기반으로 구분해서 작성함
CMD ["gunicorn", "django_docker.wsgi:application", "--config", "gunicorn.conf.py"]
