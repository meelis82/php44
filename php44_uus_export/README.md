# PHP 4.4.9 Docker - Ubuntu Latest LTS

See on uuendatud versioon PHP 4.4.9 Docker konteinerist, mis kasutab Ubuntu latest LTS baasimage'i (Debian Wheezy asemel).

## Muudatused

- **Baasimage**: Ubuntu latest LTS (varem Debian Wheezy)
- **Puppet**: Puppet 7 (automaatselt tuvastatav codename põhjal)
- **Paketid**: Uuendatud Ubuntu LTS-iga ühilduvaks
  - `libpng12-dev` → `libpng-dev`
  - Eemaldatud `libcloog-ppl0` (ei ole enam vajalik)

## Tehnoloogia

- **PHP**: 4.4.9 (kompileeritud PHPFarm kaudu)
- **Baas**: Ubuntu latest LTS
- **Apache**: 2.4
- **Puppet**: 7.x
- **Postfix**: E-posti edastus
- **Cron**: Ajastatud ülesanded

## Kasutamine

### Docker Compose

```bash
cd /home/user/php44_uus
docker-compose build
docker-compose up -d
```

### Dockerfile

```bash
docker build -t php44-ubuntu:latest .
docker run -d -p 8002:8002 php44-ubuntu:latest
```

## Projekti struktuur

```
php44_uus/
├── Dockerfile              # Ubuntu latest LTS baasil
├── docker-compose.yml      # Kogu stack (Apache + PHP)
├── src/
│   ├── entrypoint.sh      # Build ja run skriptid
│   └── php-4.4/
│       ├── build.sh       # Puppet apply build
│       ├── run.sh         # Puppet apply run
│       ├── variables.sh   # Keskkonnamuutujad
│       ├── build/         # Build Puppet manifests
│       └── run/           # Runtime Puppet manifests
└── package.json           # NPM konfiguratsioon

```

## Toetatud PHP laiendused

- Xdebug (silumiseks)
- OpCache, APCu, APD (jõudluse optimeerimiseks)
- Memcached ja Redis
- PDFLib
- MySQL, FreeTDS (MS SQL)
- PHP CodeSniffer

## Kasutusotstarve

See konteiner on mõeldud **legacy PHP 4.4 rakenduste** jaoks, mis ei ole ühilduv uuemate PHP versioonidega. Tüüpiliselt kasutatakse vana Drupal või muu PHP tarkvara käitamiseks/testimiseks.

## Autor

Meelis Valgevõli <meelis82@gmail.com>

## Litsents

MIT
