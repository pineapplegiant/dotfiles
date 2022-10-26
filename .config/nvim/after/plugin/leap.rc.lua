-------------------------------------
-- Leap
-- See `:help leap`
-------------------------------------
local status, leap = pcall(require, 'leap')
if (not status) then return end

-- leap.opts.max_phase_one_targets = nil
-- leap.opts.highlight_unlabeled_phase_one_targets = false
-- leap.opts.max_highlighted_traversal_targets = 10
-- leap.opts.case_sensitive = false
-- leap.opts.equivalence_classes = { ' \t\r\n', }
-- leap.opts.substitute_chars = {}
-- leap.opts.safe_labels = {}
-- leap.opts.labels = { 's', 'f', 'n', 'j', 'k'}
-- leap.opts.special_keys = {
--   repeat_search = '<enter>',
--   next_phase_one_target = '<enter>',
--   next_target = {'<enter>', ';'},
--   prev_target = {'<tab>', ','},
--   next_group = '<space>',
--   prev_group = '<tab>',
--   multi_accept = '<enter>',
--   multi_revert = '<backspace>',
-- }

-- Defaults
local myOpts = {
	max_phase_one_targets = 0,
	-- highlight_unlabeled_phase_one_targets = false,
	-- max_highlighted_traversal_targets = 10,
	-- case_sensitive = false,
	-- equivalence_classes = { ' \t\r\n', },
	-- substitute_chars = {},
	-- -- safe_labels = { 's', 'f', 'n', 'u', 't'},
	-- -- labels = { 's', 'f', 'n', 'j', 'k'},
	-- special_keys = {
	--   repeat_search = '<enter>',
	--   next_phase_one_target = '<enter>',
	--   next_target = {'<enter>', ';'},
	--   prev_target = {'<tab>', ','},
	--   next_group = '<space>',
	--   prev_group = '<tab>',
	--   multi_accept = '<enter>',
	--   multi_revert = '<backspace>',
	-- }
}

leap.setup(myOpts)
leap.add_default_mappings()
