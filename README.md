# Soulmask linux server
Soulmask linux server docker-compose
## Usage
1. clone
2. set envs in docker-compose.yaml (port mappings should be port-to-port, like steamport: 27015 and 27015:27015/udp)
3. docker-compose up -d
4. enjoy!
## Update from Steam
docker-compose down && docker-compose build && docker-compose up -d