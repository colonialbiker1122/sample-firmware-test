class Transparent extends CommBase{
	// Э�����ʾ����, ������ļ���ֱ�Ӷ�Ӧ�����ܳ���16�ַ�
	Name = "Transparent"
		
	// ָ������̨Э�黹�Ǿ���Э�飬ʹ��"PTZ", "MATRIX"��ʾ
	Type = "COMM"
	
	CommandLen = 0
		
	// �Ƿ�ͨ���ű�������0��ͨ������ 1���ű����� 2���ⲿ����
	ParseMode = 0
	
	function ParseData(cmdBuf)
	{
		return " ";
	}
}

local cTransparent = Transparent();

return cTransparent;