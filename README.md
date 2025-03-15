# MinCapAnalyzer
A simple bash script to analyze the minimum capability that a program need.
## Usage
If the program will return 0 or other error code instantly, use `mincap.sh`:
```bash
sudo ./mincap.sh ./program.bin
```
If the program will return error code instantly or run continuously, use `mincap_timeout.sh`:
```bash
sudo ./mincap_timeout.sh ./program.bin
```
