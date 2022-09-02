module Appwrite
    class Query
        class << Query
            def equal(attribute, value)
                return addQuery(attribute, "equal", value)
            end

            def notEqual(attribute, value)
                return addQuery(attribute, "notEqual", value)
            end

            def lessThan(attribute, value)
                return addQuery(attribute, "lessThan", value)
            end
            
            def lessThanEqual(attribute, value)
                return addQuery(attribute, "lessThanEqual", value)
            end
            
            def greaterThan(attribute, value)
                return addQuery(attribute, "greaterThan", value)
            end
            
            def greaterThanEqual(attribute, value)
                return addQuery(attribute, "greaterThanEqual", value)
            end
            
            def search(attribute, value)
                return addQuery(attribute, "search", value)
            end

            def orderAsc(attribute)
                return "orderAsc(\"#{attribute}\")"
            end

            def orderDesc(attribute)
                return "orderDesc(\"#{attribute}\")"
            end

            def cursorBefore(id)
                return "cursorBefore(\"#{id}\")"
            end

            def cursorAfter(id)
                return "cursorAfter(\"#{id}\")"
            end

            def limit(limit)
                return "limit(#{limit})"
            end

            def offset(offset)
                return "offset(#{offset})"
            end

            private

            def addQuery(attribute, method, value)
                if value.is_a?(Array)
                    "#{method}(\"#{attribute}\", [#{value.map {|item| parseValues(item)}.join(',')}])"
                else
                   return "#{method}(\"#{attribute}\", [#{parseValues(value)}])"
				end
            end

            def parseValues(value)
                return value.is_a?(String) ? "\"#{value}\"" : value
            end
        end
    end
end