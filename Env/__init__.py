from gymnasium.envs.registration import register

register(
    id='CartPoleSwingUp-v0',
    entry_point='Env.envs:CartPoleSwingUpV0',
    max_episode_steps=500,
)

register(
    id='CartPoleSwingUpFixInitState-v0',
    entry_point='Env.envs:CartPoleSwingUpFixInitStateV0',
    max_episode_steps=500,
)

register(
    id='CartPoleSwingUpFixInitState-v1',
    entry_point='Env.envs:CartPoleSwingUpFixInitStateV1',
    max_episode_steps=500,
)

register(
    id='TorchCartPoleSwingUpFixInitState-v0',
    entry_point='Env.envs:TorchCartPoleSwingUpFixInitStateV0',
    max_episode_steps=500,
)