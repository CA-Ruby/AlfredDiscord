module FlowEntriesHelper
    def color(theorical_state)
        case theorical_state
        when "Contrôle"  
            "text-green-700"
        when "Relaxation"  
            "text-lime-800"
        when "Ennui"
            "text-teal-500"
        when "Apathie"  
            "text-blue-700"
        when "Inquiétude"  
            "text-purple-800"
        when "Anxiété"  
            "text-red-800"
        when "Flow"  
            "text-yellow-300"
        when "Stimulé"  
            "text-orange-500"
        else
            nil
        end
    end
    def bg(theorical_state)
        case theorical_state
        when "Contrôle"  
            "bg-green-200"
        when "Relaxation"  
            "bg-lime-200"
        when "Ennui"  
            "bg-teal-100"
        when "Apathie"  
            "bg-blue-200"
        when "Inquiétude"  
            "bg-purple-200"
        when "Anxiété"  
            "bg-red-200"
        when "Flow"  
            "bg-yellow-100"
        when "Stimulé"  
            "bg-orange-100"
        else
            nil
        end
        
    end
    
end