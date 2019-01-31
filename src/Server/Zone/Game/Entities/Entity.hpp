
#ifndef HORIZON_ZONE_GAME_ENTITIES_ENTITY_HPP
#define HORIZON_ZONE_GAME_ENTITIES_ENTITY_HPP

#include "Server/Common/Horizon.hpp"
#include "Server/Zone/Game/Entities/GridObject.hpp"
#include "Server/Zone/Game/Map/Grid/GridDefinitions.hpp"
#include "Core/Multithreading/TaskScheduler/TaskScheduler.hpp"
#include "Server/Zone/Game/Definitions/EntityDefinitions.hpp"

#include <stdlib.h>
#include <memory>
#include <iostream>

enum entity_task_schedule_group
{
	ENTITY_SCHEDULE_WALK = 0
};

namespace Horizon
{
namespace Zone
{
namespace Game
{
class Map;
class Entity
{
public:
	Entity(uint32_t guid, entity_type type);
	Entity(uint32_t guid, entity_type type, MapCoords map_coords);
	Entity(uint32_t guid, entity_type type, MapCoords map_coords, GridCoords grid_coords);
	~Entity();

	virtual void initialize();
	uint32_t get_guid() const { return _guid; }
	bool isInZone() { return _in_zone; }
	void setInZone() { _in_zone = true; }

	entity_type get_type() const { return _type; }
	void set_type(entity_type type) { _type = type; }

	std::shared_ptr<Map> get_map() { return _map.expired() ? nullptr : _map.lock(); }
	void set_map(std::shared_ptr<Map> map) { _map = map; }

	/* Map Coords */
	MapCoords &get_map_coords() { return _map_coords; }
	void set_map_coords(MapCoords const &coords) { _map_coords = coords; }

	/* Grid Coords */
	GridCoords &get_grid_coords() { return _grid_coords; }
	void set_grid_coords(GridCoords const &coords) { _grid_coords = coords; }

	void addToGrid();

	/* Update */
	virtual void update(uint32_t diff);

	/* Scheduler */
	TaskScheduler &getScheduler() { return _scheduler; }

	bool is_in_range_of(std::shared_ptr<Entity> entity, uint8_t range);

private:
	uint32_t _guid{0};
	entity_type _type{ENTITY_UNKNOWN};
	bool _in_zone{false};
	MapCoords _map_coords{0, 0};
	GridCoords _grid_coords{0, 0};
	TaskScheduler _scheduler;
	std::weak_ptr<Map> _map;
};
}
}
}

#endif /* HORIZON_ZONE_GAME_ENTITIES_ENTITY_HPP */