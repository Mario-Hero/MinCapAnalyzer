# MinCapAnalyzer
Simple bash scripts to analyze the minimum capability that a program need.
## Usage
If the program will return 0 or other error codes instantly, use `mincap.sh`:
```bash
sudo ./mincap.sh ./program.bin
```
If the program will return error codes instantly or work continuously, use `mincap_timeout.sh`, it will regard timeout as a success:
```bash
sudo ./mincap_timeout.sh ./program.bin
```
