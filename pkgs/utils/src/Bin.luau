-- name: bin
-- description: simple memory management
-- class: utility
-- author(s): Red-Blox, Primiti_ve

export type bin_item = Instance | RBXScriptConnection | () -> ...any | thread
export type bin = {
	add: (bin_item: bin_item, identifier: string) -> bin_item,
	get: () -> bin,

	remove: (identifier: string) -> (),
	empty: () -> (),
} | nil

local bins = {} :: { [string]: bin }

-- simple helper function to clean up an item
function remove_item(bin_item: bin_item): boolean
	if not bin_item then
		-- bin_item doesn't exist!
		return false
	end

	if typeof(bin_item) == "Instance" then
		-- destroy bin_item
		bin_item:Destroy()
	elseif typeof(bin_item) == "RBXScriptConnection" then
		-- disconnect bin_item
		bin_item:Disconnect()
	elseif typeof(bin_item) == "function" then
		-- run bin_item asynchronously
		-- mainly used for any tasks that run when the bin is being emptied (e.g in-depth cleanup)
		task.spawn(bin_item)
	elseif typeof(bin_item) == "thread" then
		-- cancel bin_item
		task.cancel(bin_item)
	else
		-- bin_item is not of a valid type
		return false
	end

	-- it got cleaned up successfully
	return true
end

function new(identifier: string?): bi 
	local bin_storage = {} :: { [string]: bin_item }
	local bin = {}

	if identifier then
		bins[identifier] = bin_storage
	else
		table.insert(bins, bin_storage)
	end

	function bin.add(bin_item: bin_item, identifier: string)
		-- add bin_item to bin
		bin[identifier] = bin_item

		return bin_item
	end

	-- honestly? i could just return the bin aswell as the other functions, but i find this to be neater
	function bin.get()
		return bin
	end

	function bin.remove(identifier: string)
		local bin_item = bin[identifier]

		if bin_item then
			remove_item(bin_item)
		end
	end

	function bin.empty()
		-- loop through all items in the bin
		for _, bin_item in pairs(bin) do
			remove_item(bin_item)
		end

		-- clear the bin
		table.clear(bin)
	end

	function bin.destroy()
		bin.empty()

		if identifier then
			bins[identifier] = nil
		else
			if table.find(bins, bin_storage) then
				table.remove(bins, table.find(bins, bin_storage))
			end
		end

		bin = nil
	end

	return bin
end

return {
	new = new,
}
