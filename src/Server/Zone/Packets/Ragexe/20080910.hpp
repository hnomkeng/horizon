/***************************************************
 *       _   _            _                        *
 *      | | | |          (_)                       *
 *      | |_| | ___  _ __ _ _______  _ __          *
 *      |  _  |/ _ \| '__| |_  / _ \| '_  \        *
 *      | | | | (_) | |  | |/ / (_) | | | |        *
 *      \_| |_/\___/|_|  |_/___\___/|_| |_|        *
 ***************************************************
 * This file is part of Horizon (c).
 * Copyright (c) 2020- Horizon Dev Team.
 *
 * Base Author - Sagun Khosla. (sagunxp@gmail.com)
 *
 * This library is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 **************************************************/

#ifndef HORIZON_ZONE_CLIENT_PACKET_LENGTH_TABLE_20080910
#define HORIZON_ZONE_CLIENT_PACKET_LENGTH_TABLE_20080910

#include "Core/Multithreading/LockedLookupTable.hpp"

#include "Default.hpp"

#include <utility>

namespace Horizon
{
namespace Zone
{
/**
 * @brief Client Packet Length Table object that stores
 * the packet length of each packet of this client version.
 * Packets with IDs already existent in the database are over-written.
 * The data is stored in a thread-safe lookup table.
 * RAII techinque ensures that the table is populated on instantiation.
 */
class ClientPacketLengthTable : public PacketLengthTable
{
public:
	ClientPacketLengthTable(std::shared_ptr<ZoneSession> s)
	: PacketLengthTable(s)
	{
#define ADD_HPKT(i, j, k) _hpacket_length_table.insert(i, std::make_pair(j, std::make_shared<k>(s)))
#define ADD_TPKT(i, j, k) _tpacket_length_table.insert(i, std::make_pair(j, std::make_shared<k>(s)))
		ADD_HPKT(0x00e6, -1, CZ_ACK_EXCHANGE_ITEM);
		ADD_HPKT(0x0202, -1, CZ_ADD_FRIENDS);
		ADD_HPKT(0x0218, 2, CZ_ALCHEMIST_RANK);
		ADD_HPKT(0x0118, -1, CZ_CANCEL_LOCKON);
		ADD_HPKT(0x0361, -1, CZ_CHANGE_DIRECTION2);
		ADD_HPKT(0x019d, 30, CZ_CHANGE_EFFECTSTATE);
		ADD_HPKT(0x0102, 7, CZ_CHANGE_GROUPEXPOPTION);
		ADD_HPKT(0x01ed, 14, CZ_CHOPOKGI);
		ADD_HPKT(0x01a1, 27, CZ_COMMAND_PET);
		ADD_HPKT(0x00eb, -1, CZ_CONCLUDE_EXCHANGE_ITEM);
		ADD_HPKT(0x0090, 282, CZ_CONTACTNPC);
		ADD_HPKT(0x0203, 58, CZ_DELETE_FRIENDS);
		ADD_HPKT(0x00ce, 5, CZ_DISCONNECT_ALL_CHARACTER);
		ADD_HPKT(0x01e7, 11, CZ_DORIDORI);
		ADD_HPKT(0x0436, 3, CZ_ENTER2);
		ADD_HPKT(0x00ef, -1, CZ_EXEC_EXCHANGE_ITEM);
		ADD_HPKT(0x017e, 8, CZ_GUILD_CHAT);
		ADD_HPKT(0x016e, 4, CZ_GUILD_NOTICE);
		ADD_HPKT(0x0143, -1, CZ_INPUT_EDITDLG);
		ADD_HPKT(0x01d5, 10, CZ_INPUT_EDITDLGSTR);
		ADD_HPKT(0x02f3, -1, CZ_IRMAIL_SEND);
		ADD_HPKT(0x0363, -1, CZ_ITEM_THROW2);
		ADD_HPKT(0x00ff, 4, CZ_JOIN_GROUP);
		ADD_HPKT(0x016b, 5, CZ_JOIN_GUILD);
		ADD_HPKT(0x0237, 9, CZ_KILLER_RANK);
		ADD_HPKT(0x00f9, 4, CZ_MAKE_GROUP);
		ADD_HPKT(0x0140, 60, CZ_MOVETO_MAP);
		ADD_HPKT(0x0364, 2, CZ_MOVE_ITEM_FROM_BODY_TO_STORE2);
		ADD_HPKT(0x0127, 81, CZ_MOVE_ITEM_FROM_CART_TO_BODY);
		ADD_HPKT(0x0129, -1, CZ_MOVE_ITEM_FROM_CART_TO_STORE);
		ADD_HPKT(0x0365, -1, CZ_MOVE_ITEM_FROM_STORE_TO_BODY2);
		ADD_HPKT(0x007d, 6, CZ_NOTIFY_ACTORINIT);
		ADD_HPKT(0x00c8, 6, CZ_PC_PURCHASE_ITEMLIST);
		ADD_HPKT(0x0134, -1, CZ_PC_PURCHASE_ITEMLIST_FROMMC);
		ADD_HPKT(0x01bc, 3, CZ_RECALL);
		ADD_HPKT(0x0161, 3, CZ_REG_CHANGE_GUILD_POSITIONINFO);
		ADD_HPKT(0x01ba, -1, CZ_REMOVE_AID);
		ADD_HPKT(0x018e, 11, CZ_REQMAKINGITEM);
		ADD_HPKT(0x0368, -1, CZ_REQNAME2);
		ADD_HPKT(0x0369, -1, CZ_REQNAME_BYGID2);
		ADD_HPKT(0x0437, -1, CZ_REQUEST_ACT2);
		ADD_HPKT(0x0233, -1, CZ_REQUEST_ACTNPC);
		ADD_HPKT(0x035f, 8, CZ_REQUEST_MOVE2);
		ADD_HPKT(0x0232, -1, CZ_REQUEST_MOVENPC);
		ADD_HPKT(0x0234, -1, CZ_REQUEST_MOVETOOWNER);
		ADD_HPKT(0x0360, 8, CZ_REQUEST_TIME2);
		ADD_HPKT(0x0170, 14, CZ_REQ_ALLY_GUILD);
		ADD_HPKT(0x0130, 12, CZ_REQ_BUY_FROMMC);
		ADD_HPKT(0x0155, 12, CZ_REQ_CHANGE_MEMBERPOS);
		ADD_HPKT(0x012e, -1, CZ_REQ_CLOSESTORE);
		ADD_HPKT(0x018a, 2, CZ_REQ_DISCONNECT);
		ADD_HPKT(0x00bf, 44, CZ_REQ_EMOTION);
		ADD_HPKT(0x00d9, 6, CZ_REQ_ENTER_ROOM);
		ADD_HPKT(0x0103, -1, CZ_REQ_EXPEL_GROUP_MEMBER);
		ADD_HPKT(0x00e2, -1, CZ_REQ_EXPEL_MEMBER);
		ADD_HPKT(0x0149, 20, CZ_REQ_GIVE_MANNER_POINT);
		ADD_HPKT(0x014f, 4, CZ_REQ_GUILD_MENU);
		ADD_HPKT(0x014d, 26, CZ_REQ_GUILD_MENUINTERFACE);
		ADD_HPKT(0x017c, 54, CZ_REQ_ITEMCOMPOSITION);
		ADD_HPKT(0x017a, 26, CZ_REQ_ITEMCOMPOSITION_LIST);
		ADD_HPKT(0x0178, 6, CZ_REQ_ITEMIDENTIFY);
		ADD_HPKT(0x01fd, 15, CZ_REQ_ITEMREPAIR);
		ADD_HPKT(0x00fc, 30, CZ_REQ_JOIN_GROUP);
		ADD_HPKT(0x0159, 39, CZ_REQ_LEAVE_GUILD);
		ADD_HPKT(0x01b2, -1, CZ_REQ_OPENSTORE2);
		ADD_HPKT(0x00e0, 3, CZ_REQ_ROLE_CHANGE);
		ADD_HPKT(0x00ab, -1, CZ_REQ_TAKEOFF_EQUIP);
		ADD_HPKT(0x00b2, 14, CZ_RESTART);
		ADD_HPKT(0x01ce, 10, CZ_SELECTAUTOSPELL);
		ADD_HPKT(0x01a7, -1, CZ_SELECT_PETEGG);
		ADD_HPKT(0x00cf, 30, CZ_SETTING_WHISPER_PC);
		ADD_HPKT(0x00d0, 10, CZ_SETTING_WHISPER_STATE);
		ADD_HPKT(0x01bb, -1, CZ_SHIFT);
		ADD_HPKT(0x0112, -1, CZ_UPGRADE_SKILLLEVEL);
		ADD_HPKT(0x0439, 30, CZ_USE_ITEM2);
		ADD_HPKT(0x0438, -1, CZ_USE_SKILL2);
		ADD_HPKT(0x0366, -1, CZ_USE_SKILL_TOGROUND2);
		ADD_HPKT(0x0367, 30, CZ_USE_SKILL_TOGROUND_WITHTALKBOX2);
		ADD_HPKT(0x0096, -1, CZ_WHISPER);
		ADD_TPKT(0x0073, 7, ZC_ACCEPT_ENTER);
		ADD_TPKT(0x0083, -1, ZC_ACCEPT_QUIT);
		ADD_TPKT(0x015c, 23, ZC_ACK_BAN_GUILD);
		ADD_TPKT(0x015e, -1, ZC_ACK_DISORGANIZE_GUILD_RESULT);
		ADD_TPKT(0x01f5, 102, ZC_ACK_EXCHANGE_ITEM2);
		ADD_TPKT(0x017d, -1, ZC_ACK_ITEMCOMPOSITION);
		ADD_TPKT(0x0179, 8, ZC_ACK_ITEMIDENTIFY);
		ADD_TPKT(0x0188, -1, ZC_ACK_ITEMREFINING);
		ADD_TPKT(0x01fe, -1, ZC_ACK_ITEMREPAIR);
		ADD_TPKT(0x0274, 6, ZC_ACK_MAIL_RETURN);
		ADD_TPKT(0x0095, 6, ZC_ACK_REQNAME);
		ADD_TPKT(0x0195, -1, ZC_ACK_REQNAMEALL);
		ADD_TPKT(0x00fd, 24, ZC_ACK_REQ_JOIN_GROUP);
		ADD_TPKT(0x0110, -1, ZC_ACK_TOUSESKILL);
		ADD_TPKT(0x00e9, 5, ZC_ADD_EXCHANGE_ITEM);
		ADD_TPKT(0x0209, 12, ZC_ADD_FRIENDS_LIST);
		ADD_TPKT(0x0124, 29, ZC_ADD_ITEM_TO_CART);
		ADD_TPKT(0x01c5, 13, ZC_ADD_ITEM_TO_CART2);
		ADD_TPKT(0x00f4, 8, ZC_ADD_ITEM_TO_STORE);
		ADD_TPKT(0x01c4, -1, ZC_ADD_ITEM_TO_STORE2);
		ADD_TPKT(0x0104, -1, ZC_ADD_MEMBER_TO_GROUP);
		ADD_TPKT(0x01e9, -1, ZC_ADD_MEMBER_TO_GROUP2);
		ADD_TPKT(0x021c, 9, ZC_ALCHEMIST_POINT);
		ADD_TPKT(0x021a, 26, ZC_ALCHEMIST_RANK);
		ADD_TPKT(0x013a, 7, ZC_ATTACK_RANGE);
		ADD_TPKT(0x0147, -1, ZC_AUTORUN_SKILL);
		ADD_TPKT(0x01cd, 33, ZC_AUTOSPELLLIST);
		ADD_TPKT(0x0163, -1, ZC_BAN_LIST);
		ADD_TPKT(0x0219, 4, ZC_BLACKSMITH_RANK);
		ADD_TPKT(0x009a, 20, ZC_BROADCAST);
		ADD_TPKT(0x01c3, -1, ZC_BROADCAST2);
		ADD_TPKT(0x00ee, -1, ZC_CANCEL_EXCHANGE_ITEM);
		ADD_TPKT(0x0122, 7, ZC_CART_EQUIPMENT_ITEMLIST);
		ADD_TPKT(0x0297, -1, ZC_CART_EQUIPMENT_ITEMLIST2);
		ADD_TPKT(0x0123, -1, ZC_CART_NORMAL_ITEMLIST);
		ADD_TPKT(0x01ef, 90, ZC_CART_NORMAL_ITEMLIST2);
		ADD_TPKT(0x009c, -1, ZC_CHANGE_DIRECTION);
		ADD_TPKT(0x00b6, 2, ZC_CLOSE_DIALOG);
		ADD_TPKT(0x00f8, 6, ZC_CLOSE_STORE);
		ADD_TPKT(0x01d2, -1, ZC_COMBODELAY);
		ADD_TPKT(0x00ec, -1, ZC_CONCLUDE_EXCHANGE_ITEM);
		ADD_TPKT(0x01ea, 4, ZC_CONGRATULATION);
		ADD_TPKT(0x0141, -1, ZC_COUPLESTATUS);
		ADD_TPKT(0x0137, -1, ZC_DELETEITEM_FROM_MCSTORE);
		ADD_TPKT(0x020a, 7, ZC_DELETE_FRIENDS);
		ADD_TPKT(0x0105, -1, ZC_DELETE_MEMBER_FROM_GROUP);
		ADD_TPKT(0x00d8, -1, ZC_DESTROY_ROOM);
		ADD_TPKT(0x01b9, 6, ZC_DISPEL);
		ADD_TPKT(0x00db, 28, ZC_ENTER_ROOM);
		ADD_TPKT(0x0295, -1, ZC_EQUIPMENT_ITEMLIST2);
		ADD_TPKT(0x013c, 14, ZC_EQUIP_ARROW);
		ADD_TPKT(0x0206, 2, ZC_FRIENDS_STATE);
		ADD_TPKT(0x0227, 11, ZC_GAME_GUARD);
		ADD_TPKT(0x00fb, 3, ZC_GROUP_LIST);
		ADD_TPKT(0x017f, -1, ZC_GUILD_CHAT);
		ADD_TPKT(0x0239, 3, ZC_HOSKILLINFO_UPDATE);
		ADD_TPKT(0x02f5, -1, ZC_IRMAIL_NOTIFY);
		ADD_TPKT(0x02f4, 11, ZC_IRMAIL_SEND_RES);
		ADD_TPKT(0x017b, 32, ZC_ITEMCOMPOSITION_LIST);
		ADD_TPKT(0x0177, -1, ZC_ITEMIDENTIFY_LIST);
		ADD_TPKT(0x009d, 4, ZC_ITEM_ENTRY);
		ADD_TPKT(0x029a, 2, ZC_ITEM_PICKUP_ACK2);
		ADD_TPKT(0x00af, -1, ZC_ITEM_THROW_ACK);
		ADD_TPKT(0x0238, 71, ZC_KILLER_RANK);
		ADD_TPKT(0x00b1, 55, ZC_LONGPAR_CHANGE);
		ADD_TPKT(0x018d, -1, ZC_MAKABLEITEMLIST);
		ADD_TPKT(0x00dd, 10, ZC_MEMBER_EXIT);
		ADD_TPKT(0x00dc, 15, ZC_MEMBER_NEWENTRY);
		ADD_TPKT(0x018c, -1, ZC_MONSTER_INFO);
		ADD_TPKT(0x0196, 7, ZC_MSG_STATE_CHANGE);
		ADD_TPKT(0x010c, 33, ZC_MVP);
		ADD_TPKT(0x010a, 6, ZC_MVP_GETTING_ITEM);
		ADD_TPKT(0x014c, 6, ZC_MYGUILD_BASIC_INFO);
		ADD_TPKT(0x00a3, 4, ZC_NORMAL_ITEMLIST);
		ADD_TPKT(0x008a, 79, ZC_NOTIFY_ACT);
		ADD_TPKT(0x02e1, 2, ZC_NOTIFY_ACT2);
		ADD_TPKT(0x007a, 27, ZC_NOTIFY_ACTENTRY);
		ADD_TPKT(0x0121, 3, ZC_NOTIFY_CARTITEM_COUNTINFO);
		ADD_TPKT(0x008d, 3, ZC_NOTIFY_CHAT);
		ADD_TPKT(0x0109, -1, ZC_NOTIFY_CHAT_PARTY);
		ADD_TPKT(0x019b, 14, ZC_NOTIFY_EFFECT);
		ADD_TPKT(0x0117, 22, ZC_NOTIFY_GROUNDSKILL);
		ADD_TPKT(0x0075, 3, ZC_NOTIFY_INITCHAR);
		ADD_TPKT(0x0189, 16, ZC_NOTIFY_MAPINFO);
		ADD_TPKT(0x01d6, 22, ZC_NOTIFY_MAPPROPERTY2);
		ADD_TPKT(0x007b, 6, ZC_NOTIFY_MOVEENTRY);
		ADD_TPKT(0x01da, 3, ZC_NOTIFY_MOVEENTRY2);
		ADD_TPKT(0x022c, -1, ZC_NOTIFY_MOVEENTRY3);
		ADD_TPKT(0x02ec, 30, ZC_NOTIFY_MOVEENTRY4);
		ADD_TPKT(0x01d9, 282, ZC_NOTIFY_NEWENTRY2);
		ADD_TPKT(0x02ed, -1, ZC_NOTIFY_NEWENTRY4);
		ADD_TPKT(0x008e, -1, ZC_NOTIFY_PLAYERCHAT);
		ADD_TPKT(0x0087, -1, ZC_NOTIFY_PLAYERMOVE);
		ADD_TPKT(0x0107, 3, ZC_NOTIFY_POSITION_TO_GROUPM);
		ADD_TPKT(0x01eb, -1, ZC_NOTIFY_POSITION_TO_GUILDM);
		ADD_TPKT(0x0078, 10, ZC_NOTIFY_STANDENTRY);
		ADD_TPKT(0x01d8, 6, ZC_NOTIFY_STANDENTRY2);
		ADD_TPKT(0x022a, 21, ZC_NOTIFY_STANDENTRY3);
		ADD_TPKT(0x02ee, 3, ZC_NOTIFY_STANDENTRY4);
		ADD_TPKT(0x007c, 6, ZC_NOTIFY_STANDENTRY_NPC);
		ADD_TPKT(0x00f2, 4, ZC_NOTIFY_STOREITEM_COUNTINFO);
		ADD_TPKT(0x0077, 26, ZC_NOTIFY_UPDATEPLAYER);
		ADD_TPKT(0x0080, -1, ZC_NOTIFY_VANISH);
		ADD_TPKT(0x0091, -1, ZC_NPCACK_MAPMOVE);
		ADD_TPKT(0x0092, 114, ZC_NPCACK_SERVERMOVE);
		ADD_TPKT(0x012d, -1, ZC_OPENSTORE);
		ADD_TPKT(0x01d4, 26, ZC_OPEN_EDITDLGSTR);
		ADD_TPKT(0x01ab, 16, ZC_PAR_CHANGE_USER);
		ADD_TPKT(0x00c6, 19, ZC_PC_PURCHASE_ITEMLIST);
		ADD_TPKT(0x0133, -1, ZC_PC_PURCHASE_ITEMLIST_FROMMC);
		ADD_TPKT(0x0136, -1, ZC_PC_PURCHASE_MYITEMLIST);
		ADD_TPKT(0x0135, -1, ZC_PC_PURCHASE_RESULT_FROMMC);
		ADD_TPKT(0x00c7, 10, ZC_PC_SELL_ITEMLIST);
		ADD_TPKT(0x01aa, -1, ZC_PET_ACT);
		ADD_TPKT(0x0166, 13, ZC_POSITION_ID_NAME_INFO);
		ADD_TPKT(0x0160, 6, ZC_POSITION_INFO);
		ADD_TPKT(0x022e, -1, ZC_PROPERTY_HOMUN);
		ADD_TPKT(0x01a2, -1, ZC_PROPERTY_PET);
		ADD_TPKT(0x013d, -1, ZC_RECOVERY);
		ADD_TPKT(0x00da, 6, ZC_REFUSE_ENTER_ROOM);
		ADD_TPKT(0x01fc, 16, ZC_REPAIRITEMLIST);
		ADD_TPKT(0x0207, -1, ZC_REQ_ADD_FRIENDS);
		ADD_TPKT(0x0171, -1, ZC_REQ_ALLY_GUILD);
		ADD_TPKT(0x00e5, 35, ZC_REQ_EXCHANGE_ITEM);
		ADD_TPKT(0x01f4, 10, ZC_REQ_EXCHANGE_ITEM2);
		ADD_TPKT(0x016a, 8, ZC_REQ_JOIN_GUILD);
		ADD_TPKT(0x023a, -1, ZC_REQ_STORE_PASSWORD);
		ADD_TPKT(0x00ac, 6, ZC_REQ_TAKEOFF_EQUIP_ACK);
		ADD_TPKT(0x00b3, 3, ZC_RESTART_ACK);
		ADD_TPKT(0x0167, 11, ZC_RESULT_MAKE_GUILD);
		ADD_TPKT(0x023c, -1, ZC_RESULT_STORE_PASSWORD);
		ADD_TPKT(0x00e1, -1, ZC_ROLE_CHANGE);
		ADD_TPKT(0x00d2, 2, ZC_SETTING_WHISPER_STATE);
		ADD_TPKT(0x011f, -1, ZC_SKILL_ENTRY);
		ADD_TPKT(0x01c9, 6, ZC_SKILL_ENTRY2);
		ADD_TPKT(0x01ac, 28, ZC_SKILL_UPDATE);
		ADD_TPKT(0x01d0, 31, ZC_SPIRITS);
		ADD_TPKT(0x01e1, 4, ZC_SPIRITS2);
		ADD_TPKT(0x00c3, 8, ZC_SPRITE_CHANGE);
		ADD_TPKT(0x01d7, -1, ZC_SPRITE_CHANGE2);
		ADD_TPKT(0x020e, -1, ZC_STARSKILL);
		ADD_TPKT(0x0119, 29, ZC_STATE_CHANGE);
		ADD_TPKT(0x0229, -1, ZC_STATE_CHANGE3);
		ADD_TPKT(0x00bd, -1, ZC_STATUS);
		ADD_TPKT(0x00bc, -1, ZC_STATUS_CHANGE_ACK);
		ADD_TPKT(0x0088, -1, ZC_STOPMOVE);
		ADD_TPKT(0x0131, -1, ZC_STORE_ENTRY);
		ADD_TPKT(0x00a6, 10, ZC_STORE_EQUIPMENT_ITEMLIST);
		ADD_TPKT(0x0224, 66, ZC_TAEKWON_POINT);
		ADD_TPKT(0x01a0, 2, ZC_TRYCAPTURE_MONSTER);
		ADD_TPKT(0x016d, 97, ZC_UPDATE_CHARSTAT);
		ADD_TPKT(0x01f2, 6, ZC_UPDATE_CHARSTAT2);
		ADD_TPKT(0x016c, 6, ZC_UPDATE_GDID);
		ADD_TPKT(0x00c2, -1, ZC_USER_COUNT);
		ADD_TPKT(0x00a8, 282, ZC_USE_ITEM_ACK);
		ADD_TPKT(0x01c8, -1, ZC_USE_ITEM_ACK2);
		ADD_TPKT(0x00b5, -1, ZC_WAIT_DIALOG);
		ADD_TPKT(0x011c, -1, ZC_WARPLIST);
		ADD_TPKT(0x0097, 58, ZC_WHISPER);
#undef ADD_TPKT
#undef ADD_HPKT
	}

	~ClientPacketLengthTable() { }

};
}
}
#endif /* HORIZON_ZONE_CLIENT_PACKET_LENGTH_TABLE_20080910 */