# docker-metronome
Docker build for PowerDNS Metronome project.

## Running

docker run --name metronome -d -p 8000:8000 -p 8001:8001 -p 2003:2003 gintsgints/docker-metronome

### Configure your PowerDNS for saving stats

carbon-server=your_docker_ip

### Request stats

wget "http://localhost:8000/stats?do=get-metrics"

