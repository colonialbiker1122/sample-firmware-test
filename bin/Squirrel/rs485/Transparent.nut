class Transparent extends RS485Base{
	// 协议的显示名称, 最好与文件名直接对应，不能超过16字符
	Name = "Transparent"
		
	// 指明是云台协议还是矩阵协议，使用"RS485"表示
	Type = "RS485 COMM"
	
	CommandLen = 6

	HeadLen = 1
	
	// 命令头数据
	HeadData = [0xE0]
	
	// 地址码
	RS485Addr = 0xFF
	
	// 是否有弹起消息
	UpMsg = 1
	
	// 是否通过脚本解析
	ParseMode = 0
}

local cTransparent = Transparent();

return cTransparent;