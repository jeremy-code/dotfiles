#!/usr/bin/env python3


import iterm2

PROFILE_NAME = "One Dark Pro Darker"
PROFILE_GUID = "C6F4549A-6E10-4392-B709-D067DB179AC2"


async def main(connection: iterm2.Connection):
    """
    Set the default iTerm2 profile to "One Dark Pro Darker".
    """
    all_profiles = await iterm2.PartialProfile.async_query(connection, [PROFILE_GUID])
    for profile in all_profiles:
        if profile.name == PROFILE_NAME:
            await profile.async_make_default()
            return


iterm2.run_until_complete(main)
