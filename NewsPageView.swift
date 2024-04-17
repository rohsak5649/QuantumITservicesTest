import SwiftUI

struct ContentView: View {
    var news = [
        News(title: "Breaking: Earthquake Hits City", image: "earthquake", detail: "In the wake of a seismic event, chaos unfolds as an earthquake rattles the city, shaking its foundations and stirring panic among its inhabitants. Buildings sway ominously, their structures tested by the powerful force of the tremor, while the ground beneath quivers with the earth's unrest. Emergency sirens wail, piercing through the air as people scramble for safety, their hearts pounding with fear and uncertainty. Dust clouds billow from collapsing structures, obscuring the once-familiar skyline with a veil of debris. Rescuers rush to the scene, their heroic efforts aimed at extracting survivors trapped beneath the rubble. Communication lines falter, disrupted by the quake's relentless tremors, leaving residents stranded and isolated in the chaos. Amidst the devastation, solidarity emerges as communities band together, offering aid and support to those in need. Yet, the aftermath paints a sobering picture of destruction and loss, with the city's landscape forever altered by the earthquake's wrath. As the tremors subside and the dust settles, the city begins the arduous journey of rebuilding and healing, determined to rise from the rubble stronger than before."),
        News(title: "New Study Reveals Health Benefits of Coffee", image: "coffee", detail: "A groundbreaking study has unveiled the myriad health benefits associated with coffee consumption, shedding light on its potential to promote well-being beyond the morning caffeine fix. Researchers have found compelling evidence suggesting that moderate coffee intake may reduce the risk of various chronic diseases, including heart disease, type 2 diabetes, and certain cancers. Furthermore, coffee has been linked to improved cognitive function, providing a mental boost that enhances focus, alertness, and mood. Rich in antioxidants, coffee exhibits anti-inflammatory properties that may contribute to longevity and overall health. Moreover, recent findings suggest that coffee consumption is inversely associated with the risk of neurodegenerative diseases such as Alzheimer's and Parkinson's. However, while the study highlights the positive effects of coffee, it underscores the importance of moderation, as excessive intake can lead to adverse effects such as insomnia, jitteriness, and increased heart rate. As the scientific community continues to unravel the complexities of coffee's impact on health, these findings offer a compelling case for enjoying a cup of joe in moderation as part of a balanced lifestyle."),
        News(title: "Tech Giant Unveils Latest Smartphone", image: "smartphone", detail: "In a highly anticipated reveal, the tech giant has pulled back the curtain on its latest innovation in the realm of smartphones, setting the stage for a new era of mobile technology. Boasting cutting-edge features and sleek design, the new device promises to revolutionize the way we interact with our digital world. With a focus on user experience, the smartphone introduces groundbreaking advancements in performance, efficiency, and connectivity. Equipped with state-of-the-art processors and enhanced AI capabilities, it delivers lightning-fast speeds and seamless multitasking, ensuring a smooth and responsive user experience. The device also raises the bar for photography enthusiasts, featuring an advanced camera system that captures stunning images and videos in any environment. Furthermore, it integrates seamlessly with the latest wireless technologies, offering blazing-fast 5G connectivity and enhanced security features to safeguard personal data. As consumers eagerly await its release, the unveiling of this latest smartphone reaffirms the tech giant's commitment to innovation and excellence in the ever-evolving landscape of mobile technology."),
        News(title: "Climate Change Conference Concludes", image: "climate", detail: "The Climate Change Conference has drawn to a close, leaving behind a trail of deliberation, collaboration, and renewed commitment in the fight against the global climate crisis. Delegates from nations around the world gathered to confront the pressing challenges posed by rising temperatures, extreme weather events, and environmental degradation. Amidst intense negotiations, discussions centered on ambitious targets to curb greenhouse gas emissions, transition to renewable energy sources, and mitigate the impacts of climate change on vulnerable communities. Key agreements were reached, signaling a collective resolve to accelerate efforts towards achieving the goals set forth in the Paris Agreement. Furthermore, pledges were made to provide financial assistance to developing nations, aiding them in their transition to low-carbon economies and bolstering their resilience to climate-related disasters. While the conference marks a significant step forward in the global response to climate change, much work remains to be done. As nations return home, the focus now shifts to implementing concrete measures and holding each other accountable for meeting their commitments. With the urgent need for action clearer than ever, the conclusion of the Climate Change Conference serves as a rallying cry for unity, determination, and collaboration in safeguarding the future of our planet."),
        News(title: "Space Agency Announces Mission to Mars", image: "mars", detail: "Amidst great anticipation, the space agency has officially announced its ambitious mission to Mars, marking a historic milestone in humanity's exploration of the cosmos. This groundbreaking endeavor represents the culmination of years of scientific research, technological innovation, and international collaboration, aiming to propel human understanding of the Red Planet to new heights while laying the groundwork for future human exploration. Equipped with state-of-the-art spacecraft and cutting-edge technology, the mission will embark on a journey spanning millions of miles across space, conducting groundbreaking experiments upon reaching Mars to deepen our understanding of its geology, atmosphere, and potential for life. Central to the mission's objectives is the search for signs of past or present life on Mars, captivating the imagination of scientists and enthusiasts alike. Moreover, the mission signifies a pivotal step towards realizing humanity's dream of establishing a sustainable human presence beyond Earth, with insights gained informing future endeavors for Mars exploration and colonization. As the countdown to launch begins, excitement mounts worldwide, marking a testament to humanity's boundless curiosity and unwavering spirit of exploration, propelling us ever closer to the stars.")
    ]
    
    var body: some View {
        NavigationView {
            List(news) { item in
                NavigationLink(destination: NewsDetailView(news: item)) {
                    NewsRow(news: item)
                }
            }
            .navigationTitle("News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct News: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var detail: String 
    
}

struct NewsRow: View {
    var news: News
    
    var body: some View {
        ZStack {
            Image(news.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame( width: 300,height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )
            
            Text(news.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}

struct NewsDetailView: View {
    var news: News
    
    var body: some View {
        VStack {
            Image(news.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
          
                Text(news.title)
                    .font(.title)
            
            
            ScrollView() {
                Text(news.detail)
                    .padding()
            }
            
           
        }
        .navigationTitle(news.title)
    }
}
