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

## Example
Here is a `setTime.cpp` which will set the system time. Compile it and run it with `mincap_timeout.sh`, which will print the minimum capability it needs - cap_sys_time.
