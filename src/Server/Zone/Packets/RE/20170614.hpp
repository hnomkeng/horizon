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

#ifndef HORIZON_ZONE_CLIENT_PACKET_LENGTH_TABLE_20170614
#define HORIZON_ZONE_CLIENT_PACKET_LENGTH_TABLE_20170614

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
		ADD_HPKT(0x0437, 36, CZ_ACK_STORE_PASSWORD);
		ADD_HPKT(0x0867, 26, CZ_ADD_FRIENDS);
		ADD_HPKT(0x087e, 5, CZ_CHANGE_DIRECTION);
		ADD_HPKT(0x0364, 5, CZ_COMMAND_MER);
		ADD_HPKT(0x0944, 19, CZ_ENTER);
		ADD_HPKT(0x0865, 4, CZ_GANGSI_RANK);
		ADD_HPKT(0x089d, -1, CZ_ITEMLISTWIN_RES);
		ADD_HPKT(0x08ad, 6, CZ_ITEM_PICKUP);
		ADD_HPKT(0x0367, 6, CZ_ITEM_THROW);
		ADD_HPKT(0x0957, 8, CZ_JOIN_BATTLE_FIELD);
		ADD_HPKT(0x0879, 8, CZ_MOVE_ITEM_FROM_BODY_TO_STORE);
		ADD_HPKT(0x023b, 8, CZ_MOVE_ITEM_FROM_STORE_TO_BODY);
		ADD_HPKT(0x0877, 18, CZ_PARTY_BOOKING_REQ_REGISTER);
		ADD_HPKT(0x0899, 26, CZ_PARTY_JOIN_REQ);
		ADD_HPKT(0x0936, 6, CZ_REQNAME);
		ADD_HPKT(0x087d, 6, CZ_REQNAME_BYGID);
		ADD_HPKT(0x083c, 7, CZ_REQUEST_ACT);
		ADD_HPKT(0x0361, 5, CZ_REQUEST_MOVE);
		ADD_HPKT(0x0866, 6, CZ_REQUEST_TIME);
		ADD_HPKT(0x0860, 6, CZ_REQ_CLICK_TO_BUYING_STORE);
		ADD_HPKT(0x086b, 2, CZ_REQ_CLOSE_BUYING_STORE);
		ADD_HPKT(0x08a2, -1, CZ_REQ_OPEN_BUYING_STORE);
		ADD_HPKT(0x092f, -1, CZ_REQ_TRADE_BUYING_STORE);
		ADD_HPKT(0x086c, -1, CZ_SEARCH_STORE_INFO);
		ADD_HPKT(0x0928, 2, CZ_SEARCH_STORE_INFO_NEXT_PAGE);
		ADD_HPKT(0x0963, 12, CZ_SSILIST_ITEM_CLICK);
		ADD_HPKT(0x091b, 10, CZ_USE_SKILL);
		ADD_HPKT(0x0838, 10, CZ_USE_SKILL_TOGROUND);
		ADD_HPKT(0x0889, 90, CZ_USE_SKILL_TOGROUND_WITHTALKBOX);
#undef ADD_TPKT
#undef ADD_HPKT
	}

	~ClientPacketLengthTable() { }

};
}
}
#endif /* HORIZON_ZONE_CLIENT_PACKET_LENGTH_TABLE_20170614 */