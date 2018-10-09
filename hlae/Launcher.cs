﻿using System;
using System.Windows.Forms;

namespace AfxGui {

class Launcher
{
    public static bool RunLauncherDialog(IWin32Window dialogOwner)
    {
        bool bOk;

        using (LauncherForm frm = new LauncherForm())
        {
            frm.Icon = Program.Icon;
            frm.ShowInTaskbar = false;

            CfgLauncher cfg = new CfgLauncher();

            cfg.CopyFrom(GlobalConfig.Instance.Settings.Launcher);

            frm.ReadFromConfig(cfg);

            if (DialogResult.OK == frm.ShowDialog(dialogOwner))
            {
                frm.WriteToConfig(cfg);

                if (cfg.RememberChanges)
                {
                    GlobalConfig.Instance.Settings.Launcher.CopyFrom(cfg);
                    GlobalConfig.Instance.BackUp();
                }

                bOk = Launch(cfg);

                if (!bOk)
                    MessageBox.Show("Launching failed.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
            else
                bOk = true;

        }

        return bOk;

    }

        private static string GetHookPath(bool isProcess64Bit)
        {
            if (isProcess64Bit) throw new System.ApplicationException("64 Bit GoldSrc is not supported.");

            return System.Windows.Forms.Application.StartupPath + "\\AfxHookGoldSrc.dll";
        }

        public static bool Launch(CfgLauncher cfg)
        {
            if (0 < System.Diagnostics.Process.GetProcessesByName("hl").Length)
                return false;

            String cmds, s1;

            //
            //	build parameters:

            cmds = "-steam -gl";

            cmds += " -game " + cfg.Modification;

            // gfx settings

            cmds += " -nofbo";

            cmds += cfg.FullScreen ? " -full -stretchaspect" : " -window";

            s1 = cfg.GfxBpp.ToString();
            if (0 < s1.Length) cmds += " -" + s1 + "bpp";

            s1 = cfg.GfxWidth.ToString();
            if (0 < s1.Length) cmds += " -w " + s1;

            s1 = cfg.GfxHeight.ToString();
            if (0 < s1.Length) cmds += " -h " + s1;

            if (cfg.GfxForce) cmds += " -forceres";

            // advanced

            s1 = "standard";
            switch(cfg.RenderMode)
            {
                case 1: s1 = "fBO"; break;
                case 2: s1 = "memoryDC"; break;
            }
            cmds += " -afxRenderMode " + s1;

            cmds += " -afxForceAlpha8 " + (cfg.ForceAlpha ? 1 : 0).ToString();

            cmds += " -afxOptimizeCaptureVis " + (cfg.OptimizeVisibilty ? 1 : 0).ToString();

            // custom command line

            s1 = cfg.CustomCmdLine;
            if (0 < s1.Length)
                cmds += " " + s1;

            //
            // Launch:

            return Loader.Load(GetHookPath, cfg.GamePath, cmds);
        }
}

} // namespace AfxGui {