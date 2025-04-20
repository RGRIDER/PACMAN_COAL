
# 🟡 Pac-Man in Assembly (Irvine32) 👻

A classic Pac-Man game built from scratch in **x86 Assembly Language** using the **Irvine32 library**.  
Navigate the maze, eat all the dots, avoid ghosts, collect fruits, and rack up points — retro style!

---

## 🕹️ Features

- ✅ Multiple Levels (Level 1, 2, 3)
- ✅ Ghosts (NPCs) with basic AI movement
- ✅ Score tracking and life system
- ✅ Fruit and coin collectibles
- ✅ Power-ups and level transitions
- ✅ Sound effects with WinMM (e.g. ghost defeat, fruit collected)
- ✅ Game instructions and welcome screen
- ✅ Cool ASCII Art for a classic arcade feel

---

## ⚙️ Technologies Used

- **Assembly Language (x86)**
- **Irvine32 Library** (for input/output and graphics)
- **WinMM.lib** (for audio playback)

---

## 📦 How to Run

1. Make sure you have **MASM** and the **Irvine32 library** set up on your system.
2. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/asm-pacman.git
   ```
3. Open the `.asm` file in your preferred IDE (e.g., Visual Studio with MASM support).
4. Compile and run the project.
5. Make sure sound files are placed correctly (modify paths if needed in `sound1`, `sound2`, etc.).
6. Use your keyboard to play — instructions are available in-game!

---

## 📜 Instructions (also available in-game)

- Eat all the dots in the maze to complete a level.
- Avoid the ghosts — touching one will cost you a life.
- Collect fruits for bonus points.
- Power Pellets allow you to eat ghosts temporarily.
- You lose when all lives are gone.
- Use keyboard to navigate and make menu selections.

---

## 👨‍💻 Author

**Haider Zia**  
Student at FAST NUCES  
🧠 Built this to explore low-level programming and relive arcade magic through Assembly!

---

## 🛠️ Notes

- Built as a console-based game with ASCII visuals.
- Sound file paths are hardcoded — update them if needed based on your file locations.
- This project was a fun challenge to explore game logic and rendering using pure Assembly.

---

## 📄 License

This project is open-source for learning and academic purposes.  
Feel free to fork, star, or suggest improvements!
