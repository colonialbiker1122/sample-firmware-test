class Transparent extends RS485Base{
	// Э�����ʾ����, ������ļ���ֱ�Ӷ�Ӧ�����ܳ���16�ַ�
	Name = "Transparent"
		
	// ָ������̨Э�黹�Ǿ���Э�飬ʹ��"RS485"��ʾ
	Type = "RS485 COMM"
	
	CommandLen = 6

	HeadLen = 1
	
	// ����ͷ����
	HeadData = [0xE0]
	
	// ��ַ��
	RS485Addr = 0xFF
	
	// �Ƿ��е�����Ϣ
	UpMsg = 1
	
	// �Ƿ�ͨ���ű�����
	ParseMode = 0
}

local cTransparent = Transparent();

return cTransparent;