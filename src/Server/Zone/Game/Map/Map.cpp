/***************************************************
 *       _   _            _                        *
 *      | | | |          (_)                       *
 *      | |_| | ___  _ __ _ _______  _ __          *
 *      |  _  |/ _ \| '__| |_  / _ \| '_  \        *
 *      | | | | (_) | |  | |/ / (_) | | | |        *
 *      \_| |_/\___/|_|  |_/___\___/|_| |_|        *
 ***************************************************
 * This file is part of Horizon (c).
 * Copyright (c) 2019 Horizon Dev Team.
 *
 * Base Author - Sagun Khosla. <sagunxp@gmail.com>
 *
 * Under a proprietary license this file is not for use
 * or viewing without permission.
 **************************************************/

#include "Map.hpp"
#include "Core/Logging/Logger.hpp"
#include "Utility/Utility.hpp"
#include "Core/Multithreading/WorkerThreadPool.hpp"
#include "Server/Zone/Game/Map/Grid/Notifiers/GridNotifiers.hpp"
#include "Server/Zone/Game/Map/Grid/Container/GridReferenceContainer.hpp"
#include "Server/Zone/Game/Map/Grid/Container/GridReferenceContainerVisitor.hpp"
#include "Server/Zone/Game/Map/Grid/Grid.hpp"

#include <type_traits>
#include <functional>
#include <fstream>

using namespace Horizon::Zone::Game;

Map::Map(std::weak_ptr<MapThreadContainer> container, std::string const &name, uint16_t width, uint16_t height, std::vector<uint8_t> const &cells)
: _container(container), _name(name), _width(width), _height(height),
  _max_grids((width / MAX_CELLS_PER_GRID), (height / MAX_CELLS_PER_GRID)),
  _gridholder(GridCoords(width, height)),
  _pathfinder(AStar::Generator({width, height}, std::bind(&Map::is_obstruction, this, std::placeholders::_1, std::placeholders::_2)))
{
	for (int y = height - 1; y >= 0; --y) {
		for (int x = 0; x < width; ++x) {
			_cells[x][y] = Cell(cells.at(y * width + x));
		}
	}
}

bool Map::is_obstruction(uint16_t x, uint16_t y)
{
	Cell c = _cells[x][y];

	if (x < 0 || y < 0 || x > _width || y > _height)
		return true;

	if (!c.isWalkable())
		return true;
	
	return false;
}

Map::~Map()
{
	ZoneLog->info("Performing cleanup on map '{}'...", _name);
}

bool Map::ensure_grid(GridCoords coords)
{
	return true;
}

void Map::ensure_all_grids()
{
	int grid_count = 0;

	for (int x = 0; x < _max_grids.x(); x++) {
		for (int y = 0; y < _max_grids.y(); y++) {
			grid_count++;
			ensure_grid(GridCoords(x, y));
		}
	}

	ZoneLog->info("Initialized {} grids for map '{}'", grid_count, _name);
}
