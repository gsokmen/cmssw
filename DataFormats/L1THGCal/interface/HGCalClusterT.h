#ifndef DataFormats_L1Trigger_HGCalClusterT_h
#define DataFormats_L1Trigger_HGCalClusterT_h

#include "DataFormats/Common/interface/Ptr.h"
#include "DataFormats/Common/interface/PtrVector.h"
#include "DataFormats/GeometryVector/interface/GlobalPoint.h"
#include "DataFormats/L1Trigger/interface/L1Candidate.h"
#include "DataFormats/L1THGCal/interface/HGCalTriggerCell.h"
#include "DataFormats/L1THGCal/interface/ClusterShapes.h"
#include "Math/Vector3D.h"


namespace l1t 
{
  template <class C> class HGCalClusterT : public L1Candidate 
  {

    public:
      typedef typename edm::PtrVector<C>::const_iterator const_iterator;

    public:
      HGCalClusterT(){}
      HGCalClusterT( const LorentzVector p4,
          int pt=0,
          int eta=0,
          int phi=0
          )
        : L1Candidate(p4, pt, eta, phi),
        valid_(true),
        detId_(0),
        centre_(0, 0, 0),
        centreProj_(0., 0., 0.),
        mipPt_(0),
        seedMipPt_(0){}

      HGCalClusterT( const edm::Ptr<C>& c ):
        valid_(true),
        detId_( c->detId() ),
        centre_(0., 0., 0.),
        centreProj_(0., 0., 0.),
        mipPt_(0.),
        seedMipPt_(0.)
      {
        addConstituent(c);
      }
      
      ~HGCalClusterT() override {};
      
      const edm::PtrVector<C>& constituents() const {return constituents_;}        
      const_iterator constituents_begin() const {return constituents_.begin();}
      const_iterator constituents_end() const {return constituents_.end();}
      unsigned size() const { return constituents_.size(); }

      void addConstituent( const edm::Ptr<C>& c )
      {
        if( constituents_.empty() )
        { 
          detId_ = HGCalDetId(c->detId());
          seedMipPt_ = c->mipPt();
        }

        /* update cluster positions */
        Basic3DVector<float> constituentCentre( c->position() );
        Basic3DVector<float> clusterCentre( centre_ );

        clusterCentre = clusterCentre*mipPt_ + constituentCentre*c->mipPt();
        if( mipPt_ + c->mipPt()!=0 ) 
        {
          clusterCentre /= ( mipPt_ + c->mipPt() ) ;
        }
        centre_ = GlobalPoint( clusterCentre );

        if( clusterCentre.z()!=0 ) 
        {
          centreProj_= GlobalPoint( clusterCentre / clusterCentre.z() );
        }
        /* update cluster energies */
        mipPt_ += c->mipPt();

        int updatedPt = hwPt() + c->hwPt();
        setHwPt(updatedPt);

        math::PtEtaPhiMLorentzVector updatedP4 ( p4() );
        updatedP4 += c->p4(); 
        setP4( updatedP4 );

        constituents_.push_back( c );

      }
      
      bool valid() const { return valid_;}
      void setValid(bool valid) { valid_ = valid;}
      
      double mipPt() const { return mipPt_; }
      double seedMipPt() const { return seedMipPt_; }
      uint32_t detId() const { return detId_.rawId(); }


      /* distance in 'cm' */
      double distance( const l1t::HGCalTriggerCell &tc ) const 
      {
        return ( tc.position() - centre_ ).mag();
      }

      const GlobalPoint& position() const { return centre_; } 
      const GlobalPoint& centre() const { return centre_; }
      const GlobalPoint& centreProj() const { return centreProj_; }

      // FIXME: will need to fix places where the shapes are directly accessed
      // Right now keep shapes() getter as non-const 
      ClusterShapes& shapes() {return shapes_;}
      double hOverE() const
      {
        double pt_em = 0.;
        double pt_had = 0.;
        double hOe = 0.;

        for(const auto& constituent : constituents())
        {
          switch( constituent->subdetId() )
          {
            case HGCEE:
              pt_em += constituent->pt();
              break;
            case HGCHEF:
              pt_had += constituent->pt();
              break;
            case HGCHEB:
              pt_had += constituent->pt();
              break;
            default:
              break;
          }
        }
        if(pt_em>0) hOe = pt_had / pt_em ;
        else hOe = -1.;
        return hOe;
      }

      uint32_t subdetId() const {return detId_.subdetId();} 
      uint32_t layer() const {return detId_.layer();}
      int32_t zside() const {return detId_.zside();}


      //shower shape

      int showerLength() const { return showerLength_; }
      int coreShowerLength() const { return coreShowerLength_; }
      int firstLayer() const { return firstLayer_; }
      int maxLayer() const { return maxLayer_; }
      float eMax() const { return eMax_; }
      float sigmaEtaEtaMax() const { return sigmaEtaEtaMax_; }
      float sigmaPhiPhiMax() const { return sigmaPhiPhiMax_; }
      float sigmaEtaEtaTot() const { return sigmaEtaEtaTot_; }
      float sigmaPhiPhiTot() const { return sigmaPhiPhiTot_; }
      float sigmaZZ() const { return sigmaZZ_; }
      float sigmaRRTot() const { return sigmaRRTot_; }
      float sigmaRRMax() const { return sigmaRRMax_; }
      float sigmaRRMean() const { return sigmaRRMean_; }

      void set_showerLength(int showerLength) { showerLength_ = showerLength;}
      void set_coreShowerLength(int coreShowerLength) { coreShowerLength_ = coreShowerLength;}
      void set_firstLayer(int firstLayer) { firstLayer_ = firstLayer;}
      void set_maxLayer(int maxLayer) { maxLayer_ = maxLayer;}
      void set_eMax(float eMax) { eMax_ = eMax;}
      void set_sigmaEtaEtaMax(float sigmaEtaEtaMax) { sigmaEtaEtaMax_ = sigmaEtaEtaMax;}
      void set_sigmaEtaEtaTot(float sigmaEtaEtaTot) { sigmaEtaEtaTot_ = sigmaEtaEtaTot;}
      void set_sigmaPhiPhiMax(float sigmaPhiPhiMax) { sigmaPhiPhiMax_ = sigmaPhiPhiMax;}
      void set_sigmaPhiPhiTot(float sigmaPhiPhiTot) { sigmaPhiPhiTot_ = sigmaPhiPhiTot;}
      void set_sigmaRRMax(float sigmaRRMax) { sigmaRRMax_ = sigmaRRMax;}
      void set_sigmaRRTot(float sigmaRRTot) { sigmaRRTot_ = sigmaRRTot;}
      void set_sigmaRRMean(float sigmaRRMean) { sigmaRRMean_ = sigmaRRMean;}
      void set_sigmaZZ(float sigmaZZ) { sigmaZZ_ = sigmaZZ;}
      
      /* operators */
      bool operator<(const HGCalClusterT<C>& cl) const {return mipPt() < cl.mipPt();}
      bool operator>(const HGCalClusterT<C>& cl) const  { return  cl<*this;   }
      bool operator<=(const HGCalClusterT<C>& cl) const { return !(cl>*this); }
      bool operator>=(const HGCalClusterT<C>& cl) const { return !(cl<*this); }

    private:
        
      bool valid_;
      HGCalDetId detId_;     
      edm::PtrVector<C> constituents_;
      GlobalPoint centre_;
      GlobalPoint centreProj_; // centre projected onto the first HGCal layer

      double mipPt_;
      double seedMipPt_;

      //shower shape

      int showerLength_;
      int coreShowerLength_;
      int firstLayer_;
      int maxLayer_;
      float eMax_;
      float sigmaEtaEtaMax_;
      float sigmaPhiPhiMax_;
      float sigmaRRMax_;
      float sigmaEtaEtaTot_;
      float sigmaPhiPhiTot_;
      float sigmaRRTot_;
      float sigmaRRMean_;
      float sigmaZZ_;

      ClusterShapes shapes_;

  };

}

#endif
