#!/usr/bin/env python3


import iterm2


async def main(connection):
    """
    Set the default iTerm2 profile to "One Dark Pro Darker".
    """
    all_profiles = await iterm2.PartialProfile.async_query(connection)
    for profile in all_profiles:
        if profile.name == "One Dark Pro Darker":
            await profile.async_make_default()
            return


iterm2.run_until_complete(main)
