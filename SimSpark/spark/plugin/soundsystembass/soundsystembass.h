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
#ifndef SOUNDSYSTEMBASS_H__
#define SOUNDSYSTEMBASS_H__

// get the interface we want to implement
#include <kerosin/soundserver/soundsystem.h>
#include <zeitgeist/class.h>

class SoundSystemBASS : public kerosin::SoundSystem
{
public:
        SoundSystemBASS();
        virtual ~SoundSystemBASS();

        bool                    Init(int inFreq);
        void                    Shutdown();

        float                   GetCPU();

        kerosin::SoundEffect*   CreateEffect(kerosin::SoundServer &soundServer);
        kerosin::SoundStream*   CreateStream(kerosin::SoundServer &soundServer);
        kerosin::SoundModule*   CreateModule(kerosin::SoundServer &soundServer);
};

DECLARE_CLASS(SoundSystemBASS)

#endif //SOUNDSYSTEMBASS_H__
