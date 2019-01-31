#ifndef HORIZON_ZONE_GAME_ENTITIES_ELEMENTAL_HPP
#define HORIZON_ZONE_GAME_ENTITIES_ELEMENTAL_HPP

#include "Server/Zone/Game/Entities/Unit/Creature/Creature.hpp"

namespace Horizon
{
namespace Zone
{
namespace Game
{
template<class T>
class GridObject;
namespace Entities
{
class Elemental : public Creature, public GridObject<Elemental>
{
public:
	Elemental(uint32_t guid);
	Elemental(uint32_t guid, MapCoords mcoords);
	Elemental(uint32_t guid, MapCoords mcoords, GridCoords gcoords);
	~Elemental();

};
}
}
}
}

#endif /* HORIZON_ZONE_GAME_ENTITIES_ELEMENTAL_HPP */