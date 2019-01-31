
#ifndef HORIZON_ZONE_GAME_ENTITIES_SKILL_HPP
#define HORIZON_ZONE_GAME_ENTITIES_SKILL_HPP

#include "Server/Zone/Game/Entities/Unit/Unit.hpp"

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
class Skill : public Unit, public GridObject<Skill>
{
public:
	Skill(uint32_t guid);
	Skill(uint32_t guid, MapCoords mcoords);
	Skill(uint32_t guid, MapCoords mcoords, GridCoords gcoords);
	~Skill();

private:
};
}
}
}
}

#endif /* HORIZON_ZONE_GAME_ENTITIES_SKILL_HPP */