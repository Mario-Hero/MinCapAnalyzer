#include <sys/time.h>
#include <unistd.h>
#include <ctime>
#include <iostream>

// Function to set the system time, will exit(1) if fail
void SetSystemTime(const struct tm &newTime)
{
    struct timeval tv;
    tv.tv_sec = mktime(const_cast<struct tm *>(&newTime)); // Convert struct tm to time_t
    tv.tv_usec = 0;

    if (settimeofday(&tv, nullptr) != 0)
    {
        perror("Failed to set system time");
        exit(1);
    }
    else
    {
        std::cout << "System time successfully updated." << std::endl;
    }
}

void GetSystemTime()
{
    time_t now = time(nullptr);
    struct tm *currentTime = localtime(&now);

    std::cout << "Current system time: "
              << (currentTime->tm_year + 1900) << "-"
              << (currentTime->tm_mon + 1) << "-"
              << currentTime->tm_mday << " "
              << currentTime->tm_hour << ":"
              << currentTime->tm_min << ":"
              << currentTime->tm_sec << std::endl;
}

int main()
{
    std::cout << "setTime.bin:" << std::endl;
    struct tm newTime = {};
    // Set your desired time here
    newTime.tm_year = 2025 - 1900; // Year since 1900
    newTime.tm_mon = 3 - 1;        // Month (0-11)
    newTime.tm_mday = 9;           // Day of the month
    newTime.tm_hour = 10;          // Hour (0-23)
    newTime.tm_min = 30;           // Minute (0-59)
    newTime.tm_sec = 0;            // Second (0-59)
    SetSystemTime(newTime);
    GetSystemTime();
    sleep(999);
    return 0;
}
