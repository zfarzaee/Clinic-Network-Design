# 🏥 Clinic Network Design

A secure and high-availability network design for a two-story medical clinic with a backup data center at the post office.

---

## 📌 Overview

This project presents a complete network design for a two-story medical clinic with a backup site located at the post office. The network ensures high availability, security, and performance for critical healthcare services including telemedicine, VoIP, and medical imaging.

---

## ✨ Key Features

- High Availability (Dual Core Routers, OSPF)
- Security (pfSense Firewall, VLANs, RADIUS Authentication)
- VoIP Telephony (50 Extensions, Asterisk)
- Wi-Fi 6 Coverage (11 Access Points)
- Backup Data Center (Post Office)
- QoS for Voice and Video Traffic
- Structured Cabling (Cat6a, Fiber Optic OM3)
- Energy Optimization (EEE, Power Capping)

---

## 🛠️ Technologies Used

- Cisco IOSv (Routing & Switching)
- pfSense (Firewall)
- Windows Server 2022 (DHCP)
- FreeRADIUS (Authentication)
- Asterisk (VoIP)
- EVE-NG & Cisco Packet Tracer (Simulation)

---

## 📂 Project Structure
Clinic-Network-Design/
├── README.md
├── Project_Report.pdf
├── Network_Topology.png
├── User_Guide.pdf
├── Troubleshooting_Guide.pdf
├── QoS_Report.pdf
├── Energy_Optimization_Report.pdf
├── Configs/
│ ├── Core-RTR1.cfg
│ ├── Core-RTR2.cfg
│ ├── Dist-Ground.cfg
│ ├── Acc-*.cfg
│ ├── pfSense.config
│ └── DHCP_Scopes.ps1
├── VoIP/
│ ├── sip.conf
│ └── extensions.conf
├── RADIUS/
│ ├── clients.conf
│ ├── users.conf
│ └── eap.conf
└── Images/
├── Rack_Front_View.png
└── Network_Topology_EVE.png

---

## 🚀 How to Deploy

1. Import the EVE-NG topology file.
2. Apply configuration files to each device.
3. Start the servers (DHCP, RADIUS, Web).
4. Run the provided test scenarios.

---

## 📊 Test Results

- Ping to NAS: PASS (0% loss)
- Wi-Fi Speed (50 users): PASS (450 Mbps)
- Roaming (3 APs): PASS (35ms)
- Failover (Core to Distribution): PASS (1.2s)
- Security Scan (Guest to Admin): PASS (blocked)
- VoIP Call Quality: PASS (Jitter < 5ms)

---

## 👤 Author
Zahra Farzaee
  
[GitHub Profile](https://github.com/zfarzaeee)

---

## 📜 License

MIT License - Free to use and modify.

---

⭐ If you found this project useful, please give it a star!
