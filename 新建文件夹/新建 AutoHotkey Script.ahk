;不显示托盘图标
;#NoTrayIcon
;跳过对话框, 自动替换旧实例
#SingleInstance force
;设置工作目录
SetWorkingDir %A_ScriptDir%
;不检查空变量是否为环境变量
#NoEnv
;启用或禁用可能产生错误的特定状况时的警告, 例如书写错误或缺少全局声明
;#Warn 
;让脚本保持后台运行
;#Persistent
;防止用户的击键与发送的击键穿插在一起
SendMode Input  
/*
**********************************Init Code Start*******************************************
*/

TrayInit()

/*
**********************************Init Code End*********************************************
*/
return
/*
**********************************User Code Start*******************************************
*/









/*
**********************************User Code End*********************************************
*/
TrayInit()
{
	Menu, Tray, NoStandard
	Menu, Tray, Add, 编辑, TrayEdit
	Menu, Tray, Default, 编辑
	Menu, Tray, Add, 暂停, TrayPause
	Menu, Tray, Add, 重启, TrayReload
	Menu, Tray, Add, 开机自启, TrayStartup
	Menu, Tray, Add, 设置, TraySetting
	Menu, Tray, Add, 关于, TrayAbout
    Menu, Tray, Add, 退出, TrayExit
	return
}

TrayEdit()
{
	Edit
	return
}
TrayPause()
{
	Pause
	return
}
TrayReload()
{
	Reload
	return
}

TraySetting()
{
	
	return
}

TrayStartup()
{
	static CheckFlg := true
	Menu, Tray, ToggleCheck, 开机自启
	StratName := StrReplace(A_ScriptName,".ahk")
	if(CheckFlg)
	{
		RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run, %StratName%, %A_ScriptFullPath%
		TrayTip,,已添加开机自启！,1,1
		CheckFlg := false 
	}
	else
	{
		RegDelete, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run, %StratName%
		TrayTip,,已取消开机自启！,1,1
		CheckFlg := true 
	}
	return
}

TrayAbout()
{
	MsgBox ,,关于,by 冷月风华！
	return
}

TrayExit()
{
	ExitApp 
}

