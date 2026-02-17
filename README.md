# FastLOB

**FastLOB** is a high-performance Limit Order Book (LOB) benchmark for C++. It is designed to evaluate and compare different data structure implementations of order books in terms of **latency, throughput, and memory efficiency**.

Traders, developers, and researchers can use **FastLOB** to:

- **Test** how various LOB designs handle high-frequency trading workloads.  
- **Measure** the performance impact of different data structures under simulated market conditions.  
- **Explore** trade-offs between speed, memory usage, and complexity in order book implementations.

Whether you’re building an HFT engine, experimenting with novel order book architectures, or just curious about microsecond-level performance, **FastLOB** provides a **flexible and open-source framework** for benchmarking.

---

## 🚀 Technologies & Tools

FastLOB is built using modern and performance-oriented technologies:

- **C++23** – leveraging the latest language features for performance and expressiveness.  
- **CMake** – for flexible and portable builds.  
- **Google Test** – for unit tests and correctness verification.  
- **High-resolution timers** – to accurately measure latency in nanoseconds.  
- **Cache-friendly memory layouts** – optimized for low-latency access.  
- **Multi-threading support** – for simulating concurrent order book updates.  

---

## 📊 Performance Metrics

FastLOB focuses on **performance-critical benchmarking** with the following metrics:

- **Throughput** – orders processed per second.  
- **Latency** – time per order, measured in nanoseconds.  
- **P50, P90, P99, P99.9 latencies** – percentile-based latency measurements.  
- **Memory usage** – per order book implementation.  
- **Scalability** – performance under multiple threads and high load.  

These metrics help you compare **different data structures** and **designs** to find the most suitable solution for HFT engines or low-latency trading systems.
