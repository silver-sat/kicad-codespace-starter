# Using KiCad from your Chromebook

KiCad runs on a computer in the cloud. You see and control it in a Chrome tab. Nothing gets installed on your Chromebook.

## Start KiCad

1. Go to this repository on GitHub and sign in.
2. Click the green **Code** button → **Codespaces** tab → **Create codespace on main**.
   (Next time, click your existing codespace in that same list instead of making a new one.)
3. Wait for the editor to load. A message pops up in the bottom-right corner about **KiCad desktop**. Click **Open in Browser**.
   - Missed it? In the editor, click the **Ports** tab at the bottom, find **KiCad desktop (6080)**, and click the globe icon.
4. Click **Connect** on the page that appears. KiCad opens a few seconds later.

If KiCad isn't on the desktop, right-click the desktop → **Terminal**, type `kicad &` and press Enter.

## Where to save your work

Save projects inside the **projects** folder (KiCad opens there). Anything saved elsewhere can be lost.

## Save to GitHub before you leave

Your codespace is not a backup. At the end of every session:

1. Go back to the editor tab.
2. Click the **Source Control** icon on the left (the branch symbol).
3. Type a short message about what you did, click **Commit**, then **Sync Changes**.

## Stop your codespace when you're done

Running codespaces use up your free hours. When you finish:

- Go to **github.com/codespaces**, click **⋯** next to your codespace, and choose **Stop codespace**.

It also stops by itself after a while if you forget, but stop it anyway.

## Tips

- It's a little slower than KiCad on a real computer, especially the 3D viewer. That's normal.
- To copy text between your Chromebook and KiCad, use the clipboard panel on the left edge of the desktop tab.
- Use the full-screen button on that panel to get more room.
- If things freeze, close the desktop tab and reopen it from the **Ports** tab. Your work is still there.
