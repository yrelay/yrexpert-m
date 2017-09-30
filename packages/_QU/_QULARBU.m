;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QULARBU^INT^1^59547,73885^0
%QULARBU ;;02:42 PM  4 Sep 1996; ; 23 Sep 93  9:15 AM
 
 
 
 
 
 
 
 
INIT(RAC,XNEXT,XEVPDS,TRANSL,TEXPLO,MODE,NUMSTR,PRFMAX) 
 
 
 N TP,TEMP,TEMPR,PILE,NEXT,SVCH,FILS,CPTPDS,CODE,GLOP,GLOPDS,VU,TABNIV
 N INV,CODIND,CODC,CODNEX,CHEM,VALDEF,%LA,CYCLE,%II,%JJ,J2,J3,CHEMS
 N IPIL,IPCOUR,INDIV,LON,LNG,TBPDS
 N TCHEM,TCODE,ICODE
 N MAX
 S VALDEF=-999999999,%LA=0,LNG=0
 S TP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TR")
 S TEMPR=$$CONCAS^%QZCHAD(TP,NUMSTR) K @(TEMPR)
 S NEXT=$$CONCAS^%QZCHAD(TEMPR,"NX")
 S TBPDS=$$CONCAS^%QZCHAD(TEMPR,"PDS")
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TT") K @(TEMP)
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PI"),CODE=$$CONCAS^%QZCHAD(TEMP,"CO")
 S VU=$$CONCAS^%QZCHAD(TEMP,"VU"),FILS=$$CONCAS^%QZCHAD(TEMP,"FILS")
 S GLOP=$$CONCAS^%QZCHAD(TEMP,"PDS"),TABNIV=$$CONCAS^%QZCHAD(TEMP,"NIV")
 S TCHEM=$$CONCAS^%QZCHAD(TEMP,"TCH")
 S TCODE=$$CONCAS^%QZCHAD(TEMP,"TCO")
 
 
 S IPCOUR=1,CODC=1
 S @CODE@(RAC)=CODC,@TRANSL@(CODC)=RAC
 S @PILE@(IPCOUR)=CODC,@PILE@(IPCOUR,"INDIV")=RAC,@PILE@(IPCOUR,"CODIN")=CODC
 
 
 S MAX=3000
 S CYCLE=0
 
 S IPIL=0
BCLPIL S IPIL=$O(@PILE@(IPIL)) G:IPIL="" PDS G:IPCOUR>MAX PDS
 S CHEMS=@PILE@(IPIL)
 S INDIV=@PILE@(IPIL,"INDIV")
 S CODIN=@PILE@(IPIL,"CODIN")
 
 
 F %II=1:1:$L(CHEMS,",")-1 I $P(CHEMS,",",%II)=CODIN S CYCLE=1 G BCLPIL
 
 S NEX="",CODNEX="",%LA=0
BCLFILS I $D(@VU@(CODIN))#10 S CODNEX=$O(@VU@(CODIN,CODNEX)) G:CODNEX="" BCLPIL S NEX=@TRANSL@(CODNEX) G FILSSUI
 X XNEXT I NEX="" S @VU@(CODIN)=%LA G BCLPIL
 I '($D(@CODE@(NEX))) S CODC=CODC+1,@TRANSL@(CODC)=NEX,@CODE@(NEX)=CODC
 S CODNEX=@CODE@(NEX)
FILSSUI S IPCOUR=IPCOUR+1,%LA=%LA+1
 S CHEM=CHEMS_","_CODNEX
 S @PILE@(IPCOUR)=CHEM,@PILE@(IPCOUR,"INDIV")=NEX,@PILE@(IPCOUR,"CODIN")=CODNEX
 S @PILE@(IPCOUR,"PERE")=IPIL
 S @VU@(CODIN,CODNEX)=""
 G BCLFILS
 
 
PDS S IPCOUR="",CPTPDS=0,@TCODE=0
PDSBCL S IPCOUR=$O(@PILE@(IPCOUR)) G:IPCOUR="" TRI
 S CHEM=@PILE@(IPCOUR),NEX=@PILE@(IPCOUR,"INDIV")
 S INDIV=$P(CHEM,",",$L(CHEM,",")-1)
 S INDIV=$S(INDIV="":"",1:@TRANSL@(INDIV))
 X XEVPDS
 S @TBPDS@(CHEM)=POIDS
 S GLOPDS=$E(GLOP,1,$L(GLOP)-1)_","_POIDS_")"
 
 
 I '($D(@GLOPDS)) S @TCODE=@TCODE+1,@GLOPDS=@TCODE,@TCODE@(@TCODE)=0
 S ICODE=@GLOPDS,@TCODE@(ICODE)=@TCODE@(ICODE)+1
 S @TCODE@(ICODE,@TCODE@(ICODE))=IPCOUR
 G PDSBCL
 
TRI G:MODE="PROFONDEUR" PTRI G:MODE="LARGEUR" LTRI
 S CHEM=0,GLOPC=GLOP,GLOP=$E(GLOP,1,$L(GLOP)-1)
TRISUIT S GLOPC=$$^%Q($Q(@GLOPC)) G:$E(GLOPC,1,$L(GLOP))'=GLOP TRIFIN
 S VAL=@GLOPC
 
 S ICODE="" F %II=1:1 S ICODE=$O(@TCODE@(VAL,ICODE)) Q:ICODE=""  S ICH=@TCODE@(VAL,ICODE),CHEMS=@PILE@(ICH),@NEXT@(CHEM)=CHEMS,CHEM=CHEMS
 G TRISUIT
TRIFIN S @NEXT@(CHEM)=0
 G ELIM
 
PTRI S @NEXT@(0)=@PILE@(1)
 S GLOPC=GLOP,GLOP=$E(GLOP,1,$L(GLOP)-1),POX=0
 
PTRI1 S GLOPC=$$^%Q($Q(@GLOPC)) G:$E(GLOPC,1,$L(GLOP))'=GLOP PTRI2
 S VAL=@GLOPC,ICODE=""
 F %II=0:0 S ICODE=$O(@TCODE@(VAL,ICODE)) Q:ICODE=""  S ICH=@TCODE@(VAL,ICODE),POX=POX+1,@PILE@(ICH,"POIDS")=POX I $D(@PILE@(ICH,"PERE")) S @PILE@(@PILE@(ICH,"PERE"),"FILS",POX)=ICH
 G PTRI1
PTRI2 S IPCOUR="",CPTPDS=0
PTRIBC S IPCOUR=$O(@PILE@(IPCOUR)) G:IPCOUR="" PTRIF
 S CHEM=@PILE@(IPCOUR)
 I $D(@PILE@(IPCOUR,"FILS")) S NEX=$O(@PILE@(IPCOUR,"FILS","")) I NEX'="" S NEX=@PILE@(IPCOUR,"FILS",NEX),CHEMS=@PILE@(NEX),@NEXT@(CHEM)=CHEMS G PTRIBC
 S IPI=IPCOUR
PTRIBC2 S POX=@PILE@(IPI,"POIDS")
 I '($D(@PILE@(IPI,"PERE"))) S @NEXT@(CHEM)=0 G PTRIBC
 S IPP=@PILE@(IPI,"PERE")
 S NEX=$O(@PILE@(IPP,"FILS",POX))
 I NEX'="" S NEX=@PILE@(IPP,"FILS",NEX),CHEMS=@PILE@(NEX),@NEXT@(CHEM)=CHEMS G PTRIBC
 S IPI=IPP G PTRIBC2
PTRIF G ELIM
 
LTRI 
 S CHEM=0
 S GLOPC=GLOP,GLOP=$E(GLOP,1,$L(GLOP)-1),POX=0
 
 F %JJ=0:0 S GLOPC=$$^%Q($Q(@GLOPC)) Q:$E(GLOPC,1,$L(GLOP))'=GLOP  S VAL=@GLOPC,ICODE="" F %II=0:0 S ICODE=$O(@TCODE@(VAL,ICODE)) Q:ICODE=""  S ICH=@TCODE@(VAL,ICODE),POX=POX+1,NIV=$L(@PILE@(ICH),","),@TABNIV@(NIV,POX)=@PILE@(ICH)
 S NIV="" F %II=0:0 S NIV=$O(@TABNIV@(NIV)) Q:NIV=""  S POX="" F %JJ=0:0 S POX=$O(@TABNIV@(NIV,POX)) Q:POX=""  S CHEMS=@TABNIV@(NIV,POX),@NEXT@(CHEM)=CHEMS,CHEM=CHEMS
 S @NEXT@(CHEM)=0
 
 
ELIM 
 
 S I=0 F %II=0:0 S J=@NEXT@(I) Q:J=0  D:$L(J,",")>PRFMAX SKIP S I=@NEXT@(I) Q:I=0
 G:TEXPLO=2 ELIMF
 G:TEXPLO=1 ELIM1
 S I=0
ELIMBC S I=@NEXT@(I) G:I=0 ELIMF
 S LON=$L(I,",") I LON>LNG S LNG=LON
 S CODIND=$P(I,",",$L(I,","))
 S J1=I,J2=@NEXT@(J1)
EL2BC G:J2=0 ELIMBC
 S CODNEX=$P(J2,",",$L(J2,","))
 I CODIND=CODNEX D SUPRES(J2) S J3=@NEXT@(J2) K @NEXT@(J2) S @NEXT@(J1)=J3,J2=J3 G EL2BC
 S J1=J2,J2=@NEXT@(J2)
 G EL2BC
 
ELIM1 S I=0
ELIM1BC S I=@NEXT@(I) G:I=0 ELIMF
 S LON=$L(I,",") I LON>LNG S LNG=LON
 G:LON<3 ELIM1BC
 S CODIND=$P(I,",",LON-1,LON),J2=I
ELIM1J S J1=J2,J2=@NEXT@(J2)
ELIM1J1 G:J2=0 ELIM1BC
 S %LA=$L(J2,",") G:%LA<3 ELIM1J
 S CODNEX=$P(J2,",",%LA-1,%LA)
 I CODIND=CODNEX D SUPRES(J2) S J3=@NEXT@(J2) K @NEXT@(J2) S (J2,@NEXT@(J1))=J3 G ELIM1J1
 G ELIM1J
 
ELIMF Q
 
SKIP F %JJ=0:0 S J=@NEXT@(J) Q:J=0  Q:$L(J,",")'>PRFMAX
 S @NEXT@(I)=J Q
 
 
SUPRES(J2) N K1,K2,K3
 S K1=J2,K2=@NEXT@(J2)
SUP2BC Q:K2=0
 I $E(K2,1,$L(J2)+1)=(J2_",") S K3=@NEXT@(K2) K @NEXT@(K2) S @NEXT@(K1)=K3,K2=K3 G SUP2BC
 S K1=K2,K2=@NEXT@(K2)
 G SUP2BC
 
 
 
 
NEXT(STRUC,CH,POIDS) 
 N TP,TEMPR,NEXT,NXCH
 S TP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TR")
 S TEMPR=$$CONCAS^%QZCHAD(TP,STRUC)
 S NEXT=$$CONCAS^%QZCHAD(TEMPR,"NX")
 S TBPDS=$$CONCAS^%QZCHAD(TEMPR,"PDS")
 I '($D(@NEXT@(CH))) Q 0
 S NXCH=@NEXT@(CH),POIDS=$S($D(@TBPDS@(NXCH)):@TBPDS@(NXCH),1:"")
 Q NXCH
 
 
NETTOIE(STRUC) 
 N TP,TEMPR
 S TP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TR")
 S TEMPR=$$CONCAS^%QZCHAD(TP,STRUC)
 K @(TEMPR)
 Q
 
 
TEST G TEST^%QULARB2

