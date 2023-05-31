/***************************************************
 *       _   _            _                        *
 *      | | | |          (_)                       *
 *      | |_| | ___  _ __ _ _______  _ __          *
 *      |  _  |/ _ \| '__| |_  / _ \| '_  \        *
 *      | | | | (_) | |  | |/ / (_) | | | |        *
 *      \_| |_/\___/|_|  |_/___\___/|_| |_|        *
 ***************************************************
 * This file is part of Horizon (c).
 * Copyright (c) 2023 Horizon Dev Team.
 *
 * Base Author - Sephus. (sagunxp@gmail.com)
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

#ifndef HORIZON_ZONE_CLIENT_PACKET_LENGTH_TABLE
#define HORIZON_ZONE_CLIENT_PACKET_LENGTH_TABLE

#include "PacketLengthTable.hpp"

namespace Horizon
{
namespace Zone
{
/**
 * @brief Auto-generated with a python generator tool authored by Sephus (sagunxp@gmail.com).
 */
class ClientPacketLengthTable : public PacketLengthTable
{
public:
	ClientPacketLengthTable(std::shared_ptr<ZoneSession> s)
	: PacketLengthTable(s)
	{
#define ADD_HPKT(i, j, k) _hpacket_length_table.insert(i, std::make_pair(j, std::make_shared<k>(s)))
#define ADD_TPKT(i, j, k) _tpacket_length_table.insert(i, std::make_pair(j, std::make_shared<k>(s)))
// Packet Version 20031110: 2 Packets
#if PACKET_VERSION >= 20031110
		ADD_HPKT(0x01e7, 2, CZ_DORIDORI);
		ADD_TPKT(0x01e6, 26, ZC_COUPLENAME);
#endif
// Packet Version 20031117: 5 Packets
#if PACKET_VERSION >= 20031117
		ADD_HPKT(0x00f9, 26, CZ_MAKE_GROUP);
		ADD_HPKT(0x01e8, 28, CZ_MAKE_GROUP2);
		ADD_TPKT(0x0104, 79, ZC_ADD_MEMBER_TO_GROUP);
		ADD_TPKT(0x01e9, 81, ZC_ADD_MEMBER_TO_GROUP2);
		ADD_TPKT(0x01ea, 6, ZC_CONGRATULATION);
#endif
// Packet Version 20031124: 3 Packets
#if PACKET_VERSION >= 20031124
		ADD_HPKT(0x01ed, 2, CZ_CHOPOKGI);
		ADD_TPKT(0x01ec, 26, ZC_GUILD_MEMBER_MAP_CHANGE);
		ADD_TPKT(0x01eb, 10, ZC_NOTIFY_POSITION_TO_GUILDM);
#endif
// Packet Version 20031208: 1 Packets
#if PACKET_VERSION >= 20031208
		ADD_TPKT(0x01ee, -1, ZC_NORMAL_ITEMLIST2);
#endif
// Packet Version 20031218: 2 Packets
#if PACKET_VERSION >= 20031218
		ADD_TPKT(0x01ef, -1, ZC_CART_NORMAL_ITEMLIST2);
		ADD_TPKT(0x01f0, -1, ZC_STORE_NORMAL_ITEMLIST2);
#endif
// Packet Version 20040216: 1 Packets
#if PACKET_VERSION >= 20040216
		ADD_TPKT(0x01f3, 10, ZC_NOTIFY_EFFECT2);
#endif
// Packet Version 20040302: 2 Packets
#if PACKET_VERSION >= 20040302
		ADD_TPKT(0x01f5, 9, ZC_ACK_EXCHANGE_ITEM2);
		ADD_TPKT(0x01f4, 32, ZC_REQ_EXCHANGE_ITEM2);
#endif
// Packet Version 20040308: 4 Packets
#if PACKET_VERSION >= 20040308
		ADD_HPKT(0x01f7, 14, CZ_JOIN_BABY);
		ADD_HPKT(0x01f9, 6, CZ_REQ_JOIN_BABY);
		ADD_TPKT(0x01f6, 34, ZC_REQ_BABY);
		ADD_TPKT(0x01f8, 2, ZC_START_BABY);
#endif
// Packet Version 20040420: 1 Packets
#if PACKET_VERSION >= 20040420
		ADD_TPKT(0x01fc, -1, ZC_REPAIRITEMLIST);
#endif
// Packet Version 20040422: 1 Packets
#if PACKET_VERSION >= 20040422
		ADD_TPKT(0x01ff, 10, ZC_HIGHJUMP);
#endif
// Packet Version 20040423: 1 Packets
#if PACKET_VERSION >= 20040423
		ADD_HPKT(0x01fd, 4, CZ_REQ_ITEMREPAIR);
#endif
// Packet Version 20040426: 1 Packets
#if PACKET_VERSION >= 20040426
		ADD_TPKT(0x01fe, 5, ZC_ACK_ITEMREPAIR);
#endif
// Packet Version 20040628: 8 Packets
#if PACKET_VERSION >= 20040628
		ADD_HPKT(0x0202, 26, CZ_ADD_FRIENDS);
		ADD_HPKT(0x0203, 10, CZ_DELETE_FRIENDS);
		ADD_TPKT(0x0209, 36, ZC_ADD_FRIENDS_LIST);
		ADD_TPKT(0x020a, 10, ZC_DELETE_FRIENDS);
		ADD_TPKT(0x0205, 26, ZC_DIVORCE);
		ADD_TPKT(0x0201, -1, ZC_FRIENDS_LIST);
		ADD_TPKT(0x0206, 11, ZC_FRIENDS_STATE);
		ADD_TPKT(0x0207, 34, ZC_REQ_ADD_FRIENDS);
#endif
// Packet Version 20040705: 2 Packets
#if PACKET_VERSION >= 20040705
		ADD_HPKT(0x0208, 14, CZ_ACK_REQ_ADD_FRIENDS);
		ADD_TPKT(0x020e, 24, ZC_STARSKILL);
#endif
// Packet Version 20040726: 2 Packets
#if PACKET_VERSION >= 20040726
		ADD_HPKT(0x00f3, -1, CZ_REQUEST_CHAT);
		ADD_HPKT(0x00f7, 10, CZ_REQUEST_TIME);
#endif
// Packet Version 20040809: 1 Packets
#if PACKET_VERSION >= 20040809
		ADD_HPKT(0x00f7, 13, CZ_REQUEST_TIME);
#endif
// Packet Version 20040816: 3 Packets
#if PACKET_VERSION >= 20040816
		ADD_HPKT(0x0212, 26, CZ_REQ_GIVE_MANNER_BYNAME);
		ADD_HPKT(0x0213, 26, CZ_REQ_STATUS_GM);
		ADD_TPKT(0x0214, 42, ZC_ACK_STATUS_GM);
#endif
// Packet Version 20040817: 2 Packets
#if PACKET_VERSION >= 20040817
		ADD_HPKT(0x020f, 10, CZ_REQ_PVPPOINT);
		ADD_TPKT(0x0210, 22, ZC_ACK_PVPPOINT);
#endif
// Packet Version 20040906: 2 Packets
#if PACKET_VERSION >= 20040906
		ADD_HPKT(0x00f3, 10, CZ_REQUEST_CHAT);
		ADD_HPKT(0x00f7, 2, CZ_REQUEST_TIME);
#endif
// Packet Version 20040920: 1 Packets
#if PACKET_VERSION >= 20040920
		ADD_HPKT(0x00f3, 18, CZ_REQUEST_CHAT);
#endif
// Packet Version 20041005: 1 Packets
#if PACKET_VERSION >= 20041005
		ADD_HPKT(0x00f3, 13, CZ_REQUEST_CHAT);
#endif
// Packet Version 20041025: 1 Packets
#if PACKET_VERSION >= 20041025
		ADD_HPKT(0x00f3, 15, CZ_REQUEST_CHAT);
#endif
// Packet Version 20041101: 1 Packets
#if PACKET_VERSION >= 20041101
		ADD_TPKT(0x0215, 6, ZC_SKILLMSG);
#endif
// Packet Version 20041108: 7 Packets
#if PACKET_VERSION >= 20041108
		ADD_HPKT(0x0218, 2, CZ_ALCHEMIST_RANK);
		ADD_HPKT(0x0217, 2, CZ_BLACKSMITH_RANK);
		ADD_TPKT(0x021c, 10, ZC_ALCHEMIST_POINT);
		ADD_TPKT(0x021a, 282, ZC_ALCHEMIST_RANK);
		ADD_TPKT(0x0216, 6, ZC_BABYMSG);
		ADD_TPKT(0x021b, 10, ZC_BLACKSMITH_POINT);
		ADD_TPKT(0x0219, 282, ZC_BLACKSMITH_RANK);
#endif
// Packet Version 20041115: 1 Packets
#if PACKET_VERSION >= 20041115
		ADD_HPKT(0x021d, 6, CZ_LESSEFFECT);
#endif
// Packet Version 20041129: 5 Packets
#if PACKET_VERSION >= 20041129
		ADD_HPKT(0x00f3, 8, CZ_REQUEST_CHAT);
		ADD_HPKT(0x00f7, 14, CZ_REQUEST_TIME);
		ADD_HPKT(0x0222, 6, CZ_REQ_WEAPONREFINE);
		ADD_TPKT(0x0223, 8, ZC_ACK_WEAPONREFINE);
		ADD_TPKT(0x0221, -1, ZC_NOTIFY_WEAPONITEMLIST);
#endif
// Packet Version 20041213: 4 Packets
#if PACKET_VERSION >= 20041213
		ADD_HPKT(0x01ca, 3, CZ_REQMAKINGHOMUN);
		ADD_TPKT(0x021e, 6, ZC_LESSEFFECT);
		ADD_TPKT(0x0220, 10, ZC_NOTIFY_CRAZYKILLER);
		ADD_TPKT(0x021f, 66, ZC_NOTIFY_PKINFO);
#endif
// Packet Version 20050103: 2 Packets
#if PACKET_VERSION >= 20050103
		ADD_HPKT(0x00f3, 8, CZ_REQUEST_CHAT);
		ADD_HPKT(0x00f7, 14, CZ_REQUEST_TIME);
#endif
// Packet Version 20050110: 2 Packets
#if PACKET_VERSION >= 20050110
		ADD_HPKT(0x00f3, -1, CZ_REQUEST_CHAT);
		ADD_HPKT(0x00f7, 21, CZ_REQUEST_TIME);
#endif
// Packet Version 20050328: 3 Packets
#if PACKET_VERSION >= 20050328
		ADD_HPKT(0x0225, 2, CZ_TAEKWON_RANK);
		ADD_TPKT(0x0224, 10, ZC_TAEKWON_POINT);
		ADD_TPKT(0x0226, 282, ZC_TAEKWON_RANK);
#endif
// Packet Version 20050404: 2 Packets
#if PACKET_VERSION >= 20050404
		ADD_HPKT(0x0228, 18, CZ_ACK_GAME_GUARD);
		ADD_TPKT(0x0227, 18, ZC_GAME_GUARD);
#endif
// Packet Version 20050411: 4 Packets
#if PACKET_VERSION >= 20050411
		ADD_TPKT(0x022c, 64, ZC_NOTIFY_MOVEENTRY3);
		ADD_TPKT(0x022b, 57, ZC_NOTIFY_NEWENTRY3);
		ADD_TPKT(0x022a, 58, ZC_NOTIFY_STANDENTRY3);
		ADD_TPKT(0x0229, 15, ZC_STATE_CHANGE3);
#endif
// Packet Version 20050425: 4 Packets
#if PACKET_VERSION >= 20050425
		ADD_HPKT(0x022d, 5, CZ_COMMAND_MER);
		ADD_HPKT(0x0233, 11, CZ_REQUEST_ACTNPC);
		ADD_HPKT(0x0232, 9, CZ_REQUEST_MOVENPC);
		ADD_HPKT(0x0234, 6, CZ_REQUEST_MOVETOOWNER);
#endif
// Packet Version 20050509: 1 Packets
#if PACKET_VERSION >= 20050509
		ADD_HPKT(0x00f7, 22, CZ_REQUEST_TIME);
#endif
// Packet Version 20050523: 1 Packets
#if PACKET_VERSION >= 20050523
		ADD_TPKT(0x0230, 12, ZC_CHANGESTATE_MER);
#endif
// Packet Version 20050530: 4 Packets
#if PACKET_VERSION >= 20050530
		ADD_HPKT(0x0237, 2, CZ_KILLER_RANK);
		ADD_TPKT(0x0235, -1, ZC_HOSKILLINFO_LIST);
		ADD_TPKT(0x0236, 10, ZC_KILLER_POINT);
		ADD_TPKT(0x0238, 282, ZC_KILLER_RANK);
#endif
// Packet Version 20050531: 1 Packets
#if PACKET_VERSION >= 20050531
		ADD_TPKT(0x0239, 11, ZC_HOSKILLINFO_UPDATE);
#endif
// Packet Version 20050608: 5 Packets
#if PACKET_VERSION >= 20050608
		ADD_HPKT(0x023b, 36, CZ_ACK_STORE_PASSWORD);
		ADD_HPKT(0x0231, 26, CZ_RENAME_MER);
		ADD_TPKT(0x022f, 5, ZC_FEED_MER);
		ADD_TPKT(0x023a, 4, ZC_REQ_STORE_PASSWORD);
		ADD_TPKT(0x023c, 6, ZC_RESULT_STORE_PASSWORD);
#endif
// Packet Version 20050622: 1 Packets
#if PACKET_VERSION >= 20050622
		ADD_TPKT(0x022e, 71, ZC_PROPERTY_HOMUN);
#endif
// Packet Version 20050628: 1 Packets
#if PACKET_VERSION >= 20050628
		ADD_HPKT(0x00f7, 18, CZ_REQUEST_TIME);
#endif
// Packet Version 20050718: 15 Packets
#if PACKET_VERSION >= 20050718
		ADD_HPKT(0x024c, 8, CZ_AUCTION_ADD_ITEM);
		ADD_HPKT(0x024f, 10, CZ_AUCTION_BUY);
		ADD_HPKT(0x024b, 4, CZ_AUCTION_CREATE);
		ADD_HPKT(0x0247, 8, CZ_MAIL_ADD_ITEM);
		ADD_HPKT(0x0243, 6, CZ_MAIL_DELETE);
		ADD_HPKT(0x0244, 6, CZ_MAIL_GET_ITEM);
		ADD_HPKT(0x023f, 2, CZ_MAIL_GET_LIST);
		ADD_HPKT(0x0241, 6, CZ_MAIL_OPEN);
		ADD_HPKT(0x0246, 4, CZ_MAIL_RESET_ITEM);
		ADD_HPKT(0x00f7, 13, CZ_REQUEST_TIME);
		ADD_TPKT(0x0252, -1, ZC_AUCTION_ITEM_REQ_SEARCH);
		ADD_TPKT(0x0250, 3, ZC_AUCTION_RESULT);
		ADD_TPKT(0x024a, 70, ZC_MAIL_RECEIVE);
		ADD_TPKT(0x0242, -1, ZC_MAIL_REQ_OPEN);
		ADD_TPKT(0x0249, 3, ZC_MAIL_REQ_SEND);
#endif
// Packet Version 20050719: 1 Packets
#if PACKET_VERSION >= 20050719
		ADD_HPKT(0x00f7, 18, CZ_REQUEST_TIME);
#endif
// Packet Version 20050801: 1 Packets
#if PACKET_VERSION >= 20050801
		ADD_TPKT(0x0245, 3, ZC_MAIL_REQ_GET_ITEM);
#endif
// Packet Version 20050808: 1 Packets
#if PACKET_VERSION >= 20050808
		ADD_HPKT(0x024d, 12, CZ_AUCTION_ADD);
#endif
// Packet Version 20050817: 2 Packets
#if PACKET_VERSION >= 20050817
		ADD_HPKT(0x0254, 3, CZ_AGREE_STARPLACE);
		ADD_TPKT(0x0253, 3, ZC_STARPLACE);
#endif
// Packet Version 20050829: 5 Packets
#if PACKET_VERSION >= 20050829
		ADD_HPKT(0x0248, -1, CZ_MAIL_SEND);
		ADD_TPKT(0x0256, 5, ZC_ACK_AUCTION_ADD_ITEM);
		ADD_TPKT(0x0255, 5, ZC_ACK_MAIL_ADD_ITEM);
		ADD_TPKT(0x0257, 8, ZC_ACK_MAIL_DELETE);
		ADD_TPKT(0x0240, -1, ZC_MAIL_REQ_GET_LIST);
#endif
// Packet Version 20051010: 2 Packets
#if PACKET_VERSION >= 20051010
		ADD_HPKT(0x025b, 6, CZ_REQ_MAKINGITEM);
		ADD_TPKT(0x025a, -1, ZC_MAKINGITEM_LIST);
#endif
// Packet Version 20051013: 1 Packets
#if PACKET_VERSION >= 20051013
		ADD_HPKT(0x025c, 4, CZ_AUCTION_REQ_MY_INFO);
#endif
// Packet Version 20051017: 2 Packets
#if PACKET_VERSION >= 20051017
		ADD_HPKT(0x025d, 6, CZ_AUCTION_REQ_MY_SELL_STOP);
		ADD_TPKT(0x025e, 4, ZC_AUCTION_ACK_MY_SELL_STOP);
#endif
// Packet Version 20051024: 2 Packets
#if PACKET_VERSION >= 20051024
		ADD_TPKT(0x025f, 6, ZC_AUCTION_WINDOWS);
		ADD_TPKT(0x0260, 6, ZC_MAIL_WINDOWS);
#endif
// Packet Version 20051107: 2 Packets
#if PACKET_VERSION >= 20051107
		ADD_HPKT(0x024e, 6, CZ_AUCTION_ADD_CANCEL);
		ADD_HPKT(0x0251, 34, CZ_AUCTION_ITEM_SEARCH);
#endif
// Packet Version 20060102: 1 Packets
#if PACKET_VERSION >= 20060102
		ADD_HPKT(0x00f7, 18, CZ_REQUEST_TIME);
#endif
// Packet Version 20060306: 1 Packets
#if PACKET_VERSION >= 20060306
		ADD_TPKT(0x0274, 8, ZC_ACK_MAIL_RETURN);
#endif
// Packet Version 20060313: 1 Packets
#if PACKET_VERSION >= 20060313
		ADD_HPKT(0x0273, 30, CZ_REQ_MAIL_RETURN);
#endif
// Packet Version 20060327: 1 Packets
#if PACKET_VERSION >= 20060327
		ADD_HPKT(0x00f7, 26, CZ_REQUEST_TIME);
#endif
// Packet Version 20060607: 3 Packets
#if PACKET_VERSION >= 20060607
		ADD_HPKT(0x0279, 2, CZ_HUNTINGLIST);
		ADD_TPKT(0x027a, -1, ZC_HUNTINGLIST);
		ADD_TPKT(0x0278, 2, ZC_NOTIFY_PCBANG);
#endif
// Packet Version 20060626: 1 Packets
#if PACKET_VERSION >= 20060626
		ADD_TPKT(0x027b, 14, ZC_PCBANG_EFFECT);
#endif
// Packet Version 20060703: 1 Packets
#if PACKET_VERSION >= 20060703
		ADD_TPKT(0x027d, 62, ZC_PROPERTY_MERCE);
#endif
// Packet Version 20060710: 1 Packets
#if PACKET_VERSION >= 20060710
		ADD_TPKT(0x027e, -1, ZC_SHANDA_PROTECT);
#endif
// Packet Version 20060904: 1 Packets
#if PACKET_VERSION >= 20060904
		ADD_TPKT(0x0283, 6, ZC_AID);
#endif
// Packet Version 20060911: 1 Packets
#if PACKET_VERSION >= 20060911
		ADD_TPKT(0x0284, 14, ZC_NOTIFY_EFFECT3);
#endif
// Packet Version 20060918: 5 Packets
#if PACKET_VERSION >= 20060918
		ADD_HPKT(0x0286, 4, CZ_DEATH_QUESTION);
		ADD_HPKT(0x0281, 4, CZ_GANGSI_RANK);
		ADD_TPKT(0x0285, 6, ZC_DEATH_QUESTION);
		ADD_TPKT(0x0280, 12, ZC_GANGSI_POINT);
		ADD_TPKT(0x0282, 284, ZC_GANGSI_RANK);
#endif
// Packet Version 20060927: 1 Packets
#if PACKET_VERSION >= 20060927
		ADD_TPKT(0x028a, 18, ZC_NPC_SHOWEFST_UPDATE);
#endif
// Packet Version 20061030: 2 Packets
#if PACKET_VERSION >= 20061030
		ADD_HPKT(0x0292, 2, CZ_STANDING_RESURRECTION);
		ADD_TPKT(0x0291, 4, ZC_MSG);
#endif
// Packet Version 20061204: 5 Packets
#if PACKET_VERSION >= 20061204
		ADD_HPKT(0x0288, 6, CZ_PC_BUY_CASH_POINT_ITEM);
		ADD_TPKT(0x0293, 70, ZC_BOSS_INFO);
		ADD_TPKT(0x0287, -1, ZC_PC_CASH_POINT_ITEMLIST);
		ADD_TPKT(0x0289, 8, ZC_PC_CASH_POINT_UPDATE);
		ADD_TPKT(0x0294, 10, ZC_READ_BOOK);
#endif
// Packet Version 20061211: 2 Packets
#if PACKET_VERSION >= 20061211
		ADD_TPKT(0x0299, 6, ZC_CASH_ITEM_DELETE);
		ADD_TPKT(0x0298, 8, ZC_CASH_TIME_COUNTER);
#endif
// Packet Version 20061218: 4 Packets
#if PACKET_VERSION >= 20061218
		ADD_TPKT(0x0297, -1, ZC_CART_EQUIPMENT_ITEMLIST2);
		ADD_TPKT(0x0295, -1, ZC_EQUIPMENT_ITEMLIST2);
		ADD_TPKT(0x029a, 27, ZC_ITEM_PICKUP_ACK2);
		ADD_TPKT(0x0296, -1, ZC_STORE_EQUIPMENT_ITEMLIST2);
#endif
// Packet Version 20061226: 8 Packets
#if PACKET_VERSION >= 20061226
		ADD_HPKT(0x029f, 3, CZ_MER_COMMAND);
		ADD_HPKT(0x02a1, 4, CZ_UNUSED_MER_UPGRADE_SKILLLEVEL);
		ADD_HPKT(0x02a0, 10, CZ_UNUSED_MER_USE_SKILL);
		ADD_TPKT(0x029b, 70, ZC_MER_INIT);
		ADD_TPKT(0x02a2, 8, ZC_MER_PAR_CHANGE);
		ADD_TPKT(0x029c, 66, ZC_MER_PROPERTY);
		ADD_TPKT(0x029d, -1, ZC_MER_SKILLINFO_LIST);
		ADD_TPKT(0x029e, 11, ZC_MER_SKILLINFO_UPDATE);
#endif
// Packet Version 20070102: 1 Packets
#if PACKET_VERSION >= 20070102
		ADD_HPKT(0x00f7, 26, CZ_REQUEST_TIME);
#endif
// Packet Version 20070108: 1 Packets
#if PACKET_VERSION >= 20070108
		ADD_HPKT(0x00f7, 15, CZ_REQUEST_TIME);
#endif
// Packet Version 20070122: 2 Packets
#if PACKET_VERSION >= 20070122
		ADD_HPKT(0x02a4, 2, CZ_GAMEGUARD_LINGO_READY);
		ADD_TPKT(0x02a3, 18, ZC_GAMEGUARD_LINGO_KEY);
#endif
// Packet Version 20070129: 1 Packets
#if PACKET_VERSION >= 20070129
		ADD_HPKT(0x02a5, 8, CZ_KSY_EVENT);
#endif
// Packet Version 20070205: 3 Packets
#if PACKET_VERSION >= 20070205
		ADD_HPKT(0x02ab, 36, CZ_ACK_CASH_PASSWORD);
		ADD_TPKT(0x02aa, 4, ZC_REQ_CASH_PASSWORD);
		ADD_TPKT(0x02ac, 6, ZC_RESULT_CASH_PASSWORD);
#endif
// Packet Version 20070212: 1 Packets
#if PACKET_VERSION >= 20070212
		ADD_HPKT(0x00f7, 22, CZ_REQUEST_TIME);
#endif
// Packet Version 20070604: 1 Packets
#if PACKET_VERSION >= 20070604
		ADD_TPKT(0x02b8, 22, ZC_ITEM_PICKUP_PARTY);
#endif
// Packet Version 20070611: 5 Packets
#if PACKET_VERSION >= 20070611
		ADD_HPKT(0x02a9, 58, CZ_HACKSHIELD_CRC_MSG);
		ADD_HPKT(0x02a7, 22, CZ_HACKSH_CPX_MSG);
		ADD_TPKT(0x02a8, 162, ZC_HACKSHIELD_CRC_MSG);
		ADD_TPKT(0x02a6, 22, ZC_HACKSH_CPX_MSG);
		ADD_TPKT(0x02b9, 191, ZC_SHORTCUT_KEY_LIST);
#endif
// Packet Version 20070618: 1 Packets
#if PACKET_VERSION >= 20070618
		ADD_HPKT(0x02ba, 11, CZ_SHORTCUT_KEY_CHANGE);
#endif
// Packet Version 20070622: 4 Packets
#if PACKET_VERSION >= 20070622
		ADD_HPKT(0x02b6, 7, CZ_ACTIVE_QUEST);
		ADD_TPKT(0x02b4, 6, ZC_DEL_QUEST);
		ADD_TPKT(0x02bb, 8, ZC_EQUIPITEM_DAMAGED);
		ADD_TPKT(0x02bc, 6, ZC_NOTIFY_PCBANG_PLAYING_TIME);
#endif
// Packet Version 20070711: 2 Packets
#if PACKET_VERSION >= 20070711
		ADD_HPKT(0x02af, 2, CZ_SRPACKET_START);
		ADD_TPKT(0x02ae, 10, ZC_UNUSED_SRPACKET_INIT);
#endif
// Packet Version 20070724: 1 Packets
#if PACKET_VERSION >= 20070724
		ADD_TPKT(0x02b1, -1, ZC_ALL_QUEST_LIST);
#endif
// Packet Version 20070807: 4 Packets
#if PACKET_VERSION >= 20070807
		ADD_HPKT(0x02c0, 2, CZ_SRPACKETR2_START);
		ADD_TPKT(0x02b7, 7, ZC_ACTIVE_QUEST);
		ADD_TPKT(0x02b2, -1, ZC_ALL_QUEST_MISSION);
		ADD_TPKT(0x02bf, 10, ZC_SRPACKETR2_INIT);
#endif
// Packet Version 20070813: 2 Packets
#if PACKET_VERSION >= 20070813
		ADD_TPKT(0x02c1, -1, ZC_NPC_CHAT);
		ADD_TPKT(0x02b5, -1, ZC_UPDATE_MISSION_HUNT);
#endif
// Packet Version 20070821: 8 Packets
#if PACKET_VERSION >= 20070821
		ADD_HPKT(0x02c8, 3, CZ_PARTY_CONFIG);
		ADD_HPKT(0x02c4, 26, CZ_PARTY_JOIN_REQ);
		ADD_HPKT(0x02c7, 7, CZ_PARTY_JOIN_REQ_ACK);
		ADD_TPKT(0x02b3, 107, ZC_ADD_QUEST);
		ADD_TPKT(0x02c2, -1, ZC_FORMATSTRING_MSG);
		ADD_TPKT(0x02c9, 3, ZC_PARTY_CONFIG);
		ADD_TPKT(0x02c6, 30, ZC_PARTY_JOIN_REQ);
		ADD_TPKT(0x02c5, 30, ZC_PARTY_JOIN_REQ_ACK);
#endif
// Packet Version 20070828: 3 Packets
#if PACKET_VERSION >= 20070828
		ADD_HPKT(0x02cf, 6, CZ_MEMORIALDUNGEON_COMMAND);
		ADD_TPKT(0x02ce, 10, ZC_MEMORIALDUNGEON_NOTIFY);
		ADD_TPKT(0x02cc, 4, ZC_MEMORIALDUNGEON_SUBSCRIPTION_NOTIFY);
#endif
// Packet Version 20070904: 5 Packets
#if PACKET_VERSION >= 20070904
		ADD_TPKT(0x02d2, -1, ZC_CART_EQUIPMENT_ITEMLIST3);
		ADD_TPKT(0x02d0, -1, ZC_EQUIPMENT_ITEMLIST3);
		ADD_TPKT(0x02d4, 29, ZC_ITEM_PICKUP_ACK3);
		ADD_TPKT(0x02d3, 4, ZC_NOTIFY_BIND_ON_EQUIP);
		ADD_TPKT(0x02d1, -1, ZC_STORE_EQUIPMENT_ITEMLIST3);
#endif
// Packet Version 20070911: 1 Packets
#if PACKET_VERSION >= 20070911
		ADD_TPKT(0x02d5, 2, ZC_ISVR_DISCONNECT);
#endif
// Packet Version 20070918: 5 Packets
#if PACKET_VERSION >= 20070918
		ADD_HPKT(0x02d8, 10, CZ_CONFIG);
		ADD_HPKT(0x02d6, 6, CZ_EQUIPWIN_MICROSCOPE);
		ADD_TPKT(0x02d9, 10, ZC_CONFIG);
		ADD_TPKT(0x02da, 3, ZC_CONFIG_NOTIFY);
		ADD_TPKT(0x02d7, -1, ZC_EQUIPWIN_MICROSCOPE);
#endif
// Packet Version 20071002: 6 Packets
#if PACKET_VERSION >= 20071002
		ADD_HPKT(0x02db, -1, CZ_BATTLEFIELD_CHAT);
		ADD_TPKT(0x02dc, -1, ZC_BATTLEFIELD_CHAT);
		ADD_TPKT(0x02dd, 32, ZC_BATTLEFIELD_NOTIFY_CAMPINFO);
		ADD_TPKT(0x02e0, 34, ZC_BATTLEFIELD_NOTIFY_HP);
		ADD_TPKT(0x02de, 6, ZC_BATTLEFIELD_NOTIFY_POINT);
		ADD_TPKT(0x02df, 36, ZC_BATTLEFIELD_NOTIFY_POSITION);
#endif
// Packet Version 20071023: 2 Packets
#if PACKET_VERSION >= 20071023
		ADD_TPKT(0x02cd, 71, ZC_MEMORIALDUNGEON_INFO);
		ADD_TPKT(0x02cb, 65, ZC_MEMORIALDUNGEON_SUBSCRIPTION_INFO);
#endif
// Packet Version 20071113: 1 Packets
#if PACKET_VERSION >= 20071113
		ADD_TPKT(0x02e1, 33, ZC_NOTIFY_ACT2);
#endif
// Packet Version 20071120: 5 Packets
#if PACKET_VERSION >= 20071120
		ADD_HPKT(0x02e6, 6, CZ_BOT_CHECK);
		ADD_HPKT(0x02e4, 8, CZ_ITEM_PICKUP_NEW_JAPEN);
		ADD_HPKT(0x02e5, 8, CZ_REQUEST_MOVE_NEW_JAPEN);
		ADD_HPKT(0x02e2, 14, CZ_USE_ITEM_NEW_JAPEN);
		ADD_HPKT(0x02e3, 25, CZ_USE_SKILL_NEW_JAPEN);
#endif
// Packet Version 20071127: 1 Packets
#if PACKET_VERSION >= 20071127
		ADD_TPKT(0x02e7, -1, ZC_MAPPROPERTY);
#endif
// Packet Version 20080318: 3 Packets
#if PACKET_VERSION >= 20080318
		ADD_HPKT(0x02f1, 2, CZ_PROGRESS);
		ADD_TPKT(0x02f0, 10, ZC_PROGRESS);
		ADD_TPKT(0x02f2, 2, ZC_PROGRESS_CANCEL);
#endif
// Packet Version 20080325: 1 Packets
#if PACKET_VERSION >= 20080325
		ADD_HPKT(0x02f3, -1, CZ_IRMAIL_SEND);
#endif
// Packet Version 20080527: 5 Packets
#if PACKET_VERSION >= 20080527
		ADD_HPKT(0x035e, 2, CZ_CLOSE_WINDOW);
		ADD_HPKT(0x0362, -1, CZ_ITEM_PICKUP2);
		ADD_HPKT(0x035c, 2, CZ_OPEN_SIMPLE_CASHSHOP_ITEMLIST);
		ADD_HPKT(0x0366, -1, CZ_USE_SKILL_TOGROUND2);
		ADD_TPKT(0x035d, -1, ZC_SIMPLE_CASHSHOP_POINT_ITEMLIST);
#endif
// Packet Version 20080618: 15 Packets
#if PACKET_VERSION >= 20080618
		ADD_HPKT(0x0361, 2, CZ_CHANGE_DIRECTION2);
		ADD_HPKT(0x02f6, -1, CZ_IRMAIL_LIST);
		ADD_HPKT(0x0363, 58, CZ_ITEM_THROW2);
		ADD_HPKT(0x0364, 15, CZ_MOVE_ITEM_FROM_BODY_TO_STORE2);
		ADD_HPKT(0x0365, -1, CZ_MOVE_ITEM_FROM_STORE_TO_BODY2);
		ADD_HPKT(0x0368, -1, CZ_REQNAME2);
		ADD_HPKT(0x0369, -1, CZ_REQNAME_BYGID2);
		ADD_HPKT(0x035f, 4, CZ_REQUEST_MOVE2);
		ADD_HPKT(0x0360, -1, CZ_REQUEST_TIME2);
		ADD_HPKT(0x0367, 29, CZ_USE_SKILL_TOGROUND_WITHTALKBOX2);
		ADD_TPKT(0x02f5, 26, ZC_IRMAIL_NOTIFY);
		ADD_TPKT(0x02f4, -1, ZC_IRMAIL_SEND_RES);
		ADD_TPKT(0x02ec, 67, ZC_NOTIFY_MOVEENTRY4);
		ADD_TPKT(0x02ed, 59, ZC_NOTIFY_NEWENTRY4);
		ADD_TPKT(0x02ee, 60, ZC_NOTIFY_STANDENTRY4);
#endif
// Packet Version 20080910: 4 Packets
#if PACKET_VERSION >= 20080910
		ADD_HPKT(0x0436, 19, CZ_ENTER2);
		ADD_HPKT(0x0437, 7, CZ_REQUEST_ACT2);
		ADD_HPKT(0x0439, 8, CZ_USE_ITEM2);
		ADD_HPKT(0x0438, 10, CZ_USE_SKILL2);
#endif
// Packet Version 20081112: 3 Packets
#if PACKET_VERSION >= 20081112
		ADD_TPKT(0x043f, 8, ZC_MSG_STATE_CHANGE2);
		ADD_TPKT(0x043d, 8, ZC_SKILL_POSTDELAY);
		ADD_TPKT(0x043e, -1, ZC_SKILL_POSTDELAY_LIST);
#endif
// Packet Version 20081126: 2 Packets
#if PACKET_VERSION >= 20081126
		ADD_TPKT(0x0440, 10, ZC_MILLENNIUMSHIELD);
		ADD_TPKT(0x0441, 4, ZC_SKILLINFO_DELETE);
#endif
// Packet Version 20081210: 2 Packets
#if PACKET_VERSION >= 20081210
		ADD_HPKT(0x0443, 8, CZ_SKILL_SELECT_RESPONSE);
		ADD_TPKT(0x0442, 8, ZC_SKILL_SELECT_REQUEST);
#endif
// Packet Version 20090114: 2 Packets
#if PACKET_VERSION >= 20090114
		ADD_HPKT(0x0445, 10, CZ_SIMPLE_BUY_CASH_POINT_ITEM);
		ADD_TPKT(0x0444, -1, ZC_SIMPLE_CASH_POINT_ITEMLIST);
#endif
// Packet Version 20090218: 1 Packets
#if PACKET_VERSION >= 20090218
		ADD_TPKT(0x0446, 14, ZC_QUEST_NOTIFY_EFFECT);
#endif
// Packet Version 20090330: 1 Packets
#if PACKET_VERSION >= 20090330
		ADD_TPKT(0x0449, 4, ZC_HACKSH_ERROR_MSG);
#endif
// Packet Version 20090408: 1 Packets
#if PACKET_VERSION >= 20090408
		ADD_HPKT(0x044a, 6, CZ_CLIENT_VERSION);
#endif
// Packet Version 20090514: 1 Packets
#if PACKET_VERSION >= 20090514
		ADD_HPKT(0x044b, 2, CZ_CLOSE_SIMPLECASH_SHOP);
#endif
// Packet Version 20090520: 8 Packets
#if PACKET_VERSION >= 20090520
		ADD_HPKT(0x0447, 2, CZ_BLOCKING_PLAY_CANCEL);
		ADD_HPKT(0x07d4, 4, CZ_ES_CANCEL);
		ADD_HPKT(0x07d3, 4, CZ_ES_CHOOSE);
		ADD_HPKT(0x07d1, 2, CZ_ES_GET_LIST);
		ADD_TPKT(0x07d6, 4, ZC_ES_GOTO);
		ADD_TPKT(0x07d2, -1, ZC_ES_LIST);
		ADD_TPKT(0x07d5, 4, ZC_ES_READY);
		ADD_TPKT(0x07d0, 6, ZC_ES_RESULT);
#endif
// Packet Version 20090603: 3 Packets
#if PACKET_VERSION >= 20090603
		ADD_HPKT(0x07da, 6, CZ_CHANGE_GROUP_MASTER);
		ADD_HPKT(0x07d7, 8, CZ_GROUPINFO_CHANGE_V2);
		ADD_TPKT(0x07d8, 8, ZC_REQ_GROUPINFO_CHANGE_V2);
#endif
// Packet Version 20090610: 1 Packets
#if PACKET_VERSION >= 20090610
		ADD_TPKT(0x07db, 8, ZC_HO_PAR_CHANGE);
#endif
// Packet Version 20090617: 5 Packets
#if PACKET_VERSION >= 20090617
		ADD_HPKT(0x07dc, 6, CZ_SEEK_PARTY);
		ADD_HPKT(0x07de, 30, CZ_SEEK_PARTY_MEMBER);
		ADD_TPKT(0x07dd, 54, ZC_SEEK_PARTY);
		ADD_TPKT(0x07df, 54, ZC_SEEK_PARTY_MEMBER);
		ADD_TPKT(0x07d9, 268, ZC_SHORTCUT_KEY_LIST_V2);
#endif
#undef ADD_TPKT
#undef ADD_HPKT
	}

	~ClientPacketLengthTable() { }

};
}
}
#endif /* HORIZON_ZONE_CLIENT_PACKET_LENGTH_TABLE */