# PS_WOL

## Overview

�������PC���ꊇ�ŋN���A�ċN���A�I�������邽�߂�PowerShell  

## Description

RemoteWakeUp.ps1 : �o�^����PC���ꊇ�ŋN������  

RemoteShutdown.ps1 : �o�^����PC���ꊇ�ŏI������  

RemoteReboot.ps1 : �o�^����PC���ꊇ�ōċN������  

## Usage

(1) _SessionList.csv��PC��o�^����

������IP�A�h���X�A���[�U�[���A�p�X���[�h�AMAC�A�h���X

``` _SessionList.csv
IP,User,PW,MAC
192.168.1.101,Test_0,password,94-C6-91-14-38-51
192.168.1.102,Test_1,password,94-C6-91-14-32-BA

```

(2) ���s����  

ps1�t�@�C�����E�N���b�N > PowerShell�Ŏ��s

## Settings

<details><summary>�V���b�g�_�E���ݒ�</summary><div>

(1) �X�^�[�g���R���g���[���p�l�����Ǘ��c�[�������[�J���Z�L�����e�B�|���V�[���Z�L�����e�B�̐ݒ聨���[�J���|���V�[���Z�L�����e�B�I�v�V����  

(2) �u���[�U�[�A�J�E���g����: �Ǘ��ҏ��F���[�h�ł��ׂĂ̊Ǘ��҂����s����v�𖳌��ɐݒ肷��  

(3)�u�l�b�g���[�N �A�N�Z�X:���[�J�� �A�J�E���g�̋��L�ƃZ�L�����e�B ���f���v���u�N���V�b�N - ���[�J�� ���[�U�����[�J�� ���[�U�Ƃ��ĔF�؂���v�ɐݒ肷��
  
(4) �ċN��  

</div></details>


<details><summary>WOL�ݒ�</summary><div>

(1) �����X�^�[�g�A�b�v����

(2) BIOS > Chipset Conf > Deep Sleep > OFF

(3) BIOS����WOL,PCIE Device��Enable

(4) �f�o�C�X�}�l�[�W���[>LAN�A�_�v�^�[>�ڍאݒ�>�v���p�e�B>Wake On Magic Paket��ON
�EWake On Magic Paket = ON
�EEnergy Efficient Ethernet = OFF

(5) �f�o�C�X�}�l�[�W���[>LAN�A�_�v�^�[>�d���Ǘ�> ���ׂă`�F�b�N

�E�@�d�͐ߖ�̂��߂ɁA�R���s���[�^�ł��̃f�o�C�X�̓d�����I�t�ɂł���悤�ɂ���

�E�@���̃f�o�C�X�ŁA�R���s���[�^�̃X�^���o�C��Ԃ������ł���悤�ɂ���

�E�@Magic Packet�ł̂݁A�R���s���[�^�̃X�^���o�C��Ԃ������ł���悤�ɂ���

[����]  
 �K���d���r����Ԃ���WOL�̃e�X�g�����鎖�B�d���l��������I����WOL�͐������邪�A�d���r�������WOL�͐������Ȃ��ꍇ������B���̏ꍇ�ALAN�A�_�v�^�[�̏ȃG�l�ݒ��d���l�����̎����N���ݒ�ŉ����ł���B

[�⑫]  
 �����IP�Ƀ}�W�b�N�p�P�b�g�𓊂���ꍇ�A���[�^�[��ARP�e�[�u���ɑ��݂��Ă��Ȃ�IP�͏��������B�����h�~���邽�߂ɂ�ARP�o�C���f�B���O���K�v�ƂȂ�i���������͓����IP�ɓ�����̂���߂ăl�b�g���[�N��̂��ׂĂ�PC�Ƀu���[�h�L���X�g����j�B�e�X�g�������͖��Ȃ�WOL�ł������̂ɁA�����Ԍo�������WOL�Ɏ��s���錴����ARP�e�[�u���̏����ɂ���B


</div></details>