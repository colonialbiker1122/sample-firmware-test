// Compile with: g++ rtsp_auth_client.cpp -o rtsp_auth_client -lliveMedia -lgroupsock -lBasicUsageEnvironment -lUsageEnvironment

#include <iostream>
#include <string>
#include <liveMedia.hh>
#include <BasicUsageEnvironment.hh>
#include <GroupsockHelper.hh> // For gettimeofday()

int main() {
    // Developer-friendly configuration
    const std::string username = "closglihsr";
    const std::string password = "245245";
    const std::string ip = "172.16.59.23";
    const std::string streamPath = "stream1";

    // Construct the RTSP URL with authentication
    std::string rtspURL = "rtsp://" + username + ":" + password + "@" + ip + "/" + streamPath;

    // 1. Set up the Live555 environment
    TaskScheduler* scheduler = BasicTaskScheduler::createNew();
    UsageEnvironment* env = BasicUsageEnvironment::createNew(*scheduler);

    // 2. Create an RTSP client for the URL
    RTSPClient* rtspClient = RTSPClient::createNew(*env, rtspURL.c_str(), 1);
    if (rtspClient == nullptr) {
        std::cerr << "Failed to create RTSP client: " << env->getResultMsg() << std::endl;
        return 1;
    }

    std::cout << "RTSP Client created for: " << rtspURL << std::endl;

    // 3. Send DESCRIBE command to the server
    rtspClient->sendDescribeCommand([](RTSPClient* client, int resultCode, char* resultString) {
        UsageEnvironment& env = client->envir();
        if (resultCode != 0) {
            env << "DESCRIBE failed: " << resultString << "\n";
        } else {
            env << "Got SDP:\n" << resultString << "\n";
        }
        delete[] resultString;
        Medium::close(client); // Cleanup RTSP client
    });

    // 4. Start the event loop (blocking call)
    env->taskScheduler().doEventLoop(); // Loop runs until manually exited or callback closes client

    // 5. Cleanup (not reached unless loop exits)
    env->reclaim();
    delete scheduler;

    return 0;
}
