# AM5 AI/Gaming Desktop Build Summary

This document summarizes the component recommendations, estimated costs, and key considerations for completing your AM5 desktop build, designed for a dual-GPU workflow for local AI development (LLM + RAG) and high-performance gaming.

---

## 1. Current Components

You have already purchased the following core components:

*   **Motherboard:** GIGABYTE X870E AORUS Pro Ice
*   **Case:** NZXT H7 Flow (2024 Mid-Tower)

---

## 2. Purchase Recommendations (Remaining)

Here are the recommendations for the remaining components, focusing on value, performance, and compatibility.

### **CPU**

*   **Top Pick (If Verifiable):** **AMD Ryzen 7 7800X3D**
    *   The local deal for ~$250 is a fantastic value. It offers the best gaming performance and is highly efficient for AI tasks.
    *   **Action:** You must verify the authenticity of this deal (check serial, receipt) and test the CPU upon purchase.

*   **Best Value Alternative:** **AMD Ryzen 7 7700**
    *   This CPU offers a great blend of performance for its price and includes a stock cooler, which is a good starting point.

*   **Note on Ryzen 7 7700X:** A solid choice if the others aren't available, but it requires a separate cooler purchase and tends to run hotter.

### **CPU Cooler**

Your NZXT H7 Flow case has excellent clearance (185mm) and radiator support.

*   **Top-Tier Air Coolers (Best Value):** These are highly recommended for their performance, reliability, and price.
    *   Thermalright Phantom Spirit 120 SE / Peerless Assassin 120 SE
    *   DeepCool AK620
    *   Scythe Fuma 3

*   **AIO Liquid Coolers (Aesthetics & Peak Temps):** A 240mm or 280mm AIO is more than enough for these CPUs.
    *   Arctic Liquid Freezer II (240/280)
    *   DeepCool LS/LT Series (240/280)
    *   Corsair iCUE Series

### **RAM**

*   **Specification:** **DDR5-6000 with CL30 timings** and **AMD EXPO** profiles. This is the "sweet spot" for Ryzen 7000 performance.
*   **Capacity:** 
    *   **32GB (2x16GB):** Ideal for gaming and most AI tasks.
    *   **48GB (2x24GB):** A great option if you plan on heavy RAG or large context size workloads.
*   **Recommended Brands:** G.Skill (Trident Z5 Neo / Flare X5), Corsair (Vengeance), TeamGroup (T-Force).
*   **ACTION:** Before buying, check your motherboard's official **Memory Support List (QVL)** on the Gigabyte website to guarantee compatibility.

### **Power Supply (PSU)**

*   **Specification:** **1000W, 80+ Gold rated, ATX 3.1 compliant.** This provides ample headroom for dual GPUs and transient spikes.
*   **Key Feature:** Must have a **native 12V-2x6 connector** (part of the PCIe 5.1 standard) for modern GPUs.
*   **Recommended Models:**
    *   SeaSonic FOCUS or PRIME Gold series (ATX 3.1 versions)
    *   Corsair RM1000e (2023+ version)
    *   MSI MAG A1000GL PCIE5
    *   Thermaltake Toughpower GF A3 Gold
*   **ACTION:** Confirm **"ATX 3.1"** and **"PCIe 5.1"** are listed on the product page or box.

### **Graphics Card (GPU)**

*   Your plan to use either **two RTX 3060 12GB** cards or a **single used RTX 4070** for ~$500 is solid. The dual 3060s offer more VRAM for experimenting with separate tasks, while the 4070 is a more powerful single card.
*   **ACTION:** If buying a used 4070, insist on an onsite test (GPU-Z, 3DMark/Unigine benchmark, temperature check) to verify its condition.

---

## 3. Estimated Remaining Costs

This budget covers the core system components you still need to purchase.

| Component      | Low-End Estimate (Value) | High-End Estimate (Premium) |
|----------------|:------------------------:|:---------------------------:|
| CPU            |          ~$240           |            ~$370            |
| CPU Cooler     |           ~$40           |            ~$150            |
| RAM (32GB)     |           ~$90           |            ~$130            |
| PSU (1000W)    |          ~$150           |            ~$200            |
| **Subtotal**   |        **~$520**         |          **~$850**          |
|                |                          |                             |
| **GPU Budget** |        **~$500**         |          **~$500**          |
|                |                          |                             |
| **Grand Total**|       **~S1,020**        |         **~$1,350**         |

---

## 4. Key Setup & Software Strategy

*   **BIOS Update:** Before installing your OS, update the motherboard BIOS to the latest stable version from Gigabyte's website. This is critical for 7800X3D voltage protection and RAM (EXPO) stability.
*   **Dual-GPU Workflow:** The most effective way to manage your dual GPUs is to isolate them using the `CUDA_VISIBLE_DEVICES` environment variable.
    *   **Example:**
        *   In one terminal, run `export CUDA_VISIBLE_DEVICES=0` before launching your LLM server (e.g., vLLM).
        *   In a second terminal, run `export CUDA_VISIBLE_DEVICES=1` before launching your RAG/embedding/vector database script.
    *   This prevents conflicts and ensures each task has a dedicated GPU, which is more efficient than tensor parallelism on consumer cards.
