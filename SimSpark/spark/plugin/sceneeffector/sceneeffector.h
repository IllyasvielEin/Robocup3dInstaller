/* -*- mode: c++; c-basic-offset: 4; indent-tabs-mode: nil -*-

   this file is part of rcssserver3D
   Fri May 9 2003
   Copyright (C) 2002,2003 Koblenz University
   Copyright (C) 2003 RoboCup Soccer Server 3D Maintenance Group
   $Id$

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; version 2 of the License.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/
#ifndef SCENEEFFECTOR_H
#define SCENEEFFECTOR_H

#include <oxygen/agentaspect/effector.h>
#include <oxygen/physicsserver/space.h>

/**
 * @class SceneEffector
 * @brief Effector for importing scene graphs (e.g. robot models) into the simulation.
 * @ingroup effectors
 */
class SceneEffector : public oxygen::Effector
{
    //
    // functions
    //
public:
    SceneEffector();
    virtual ~SceneEffector();

    /** returns the name of the predicate this effector implements. */
    virtual std::string GetPredicate() { return "scene"; }

    /** constructs an Actionobject, describing a predicate */
    virtual boost::shared_ptr<oxygen::ActionObject>
    GetActionObject(const oxygen::Predicate& predicate);

protected:
    /** realizes the action described by the ActionObject */
    virtual void PrePhysicsUpdateInternal(float deltaTime);

    virtual void OnLink();
private:
    /* increments nextSpawningPosition according to spawningOffset for the given scene */
    void IncrementNextSpawningPosition(boost::shared_ptr<oxygen::Scene> scene);

    /* calculates the bounding box of a space node */
    salt::AABB3 GetAgentBoundingBox(boost::shared_ptr<oxygen::Space> space);
};

DECLARE_CLASS(SceneEffector)

#endif // SCENEEFFECTOR_H
