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

;%CARECH^INT^1^59547,73867^0
%CARECH ;
 
 
 
 
 
 
 
 
 
 
 N NUMAC,IAC,GLO,GLOECH,GLOETA
 S GLO="^CARGRAC",GLOECH="^CARGECH",GLOETA="^CARGETA"
 K @(GLOECH),@(GLOETA)
 S NUMAC=""
 F IAC=0:0 S NUMAC=$O(@GLO@(NUMAC)) Q:NUMAC=""  D AJTACH(NUMAC)
 Q
 
 
 
 
AJTACH(NUMAC) 
 N NUMFIC,IFIC,GLO,GLOECH,GLOETAT,CA,SWI,ISWI
 S GLO="^CARGRAC",GLOECH="^CARGECH",GLOETA="^CARGETA"
 
 S CA=@GLO@(NUMAC,"TRT")
 S @GLOECH@("ACT",NUMAC,"WHOIS")=$P(CA,"^"),@GLOECH@("ACT",NUMAC,"TRT")=$P(CA,"^",2),@GLOECH@("ACT",NUMAC,"LISTE")=$P(CA,"^",3)
 
 D:$D(@GLO@(NUMAC,"CYC")) TRTCYC
 
 I $D(@GLO@(NUMAC,"SWI")) S SWI="" F ISWI=0:0 S SWI=$O(@GLO@(NUMAC,"SWI",SWI)) Q:SWI=""  S @GLOECH@("ACT",NUMAC,"SWITCH",SWI)=""
 Q:'($D(@GLO@(NUMAC,"ECH")))
 
 S NUMFIC=""
 F IFIC=0:0 S NUMFIC=$O(@GLO@(NUMAC,"ECH",NUMFIC)) Q:NUMFIC=""  D TRT
 Q
 
TRTCYC 
 N DEB,FIN,J,H,M,DEL,%I
 S CH=@GLO@(NUMAC,"CYC")
 S DEB=$P(CH,"^",1)_$P(CH,"^",2)_$P(CH,"^",3)_$P(CH,"^",4)_$P(CH,"^",5)
 S FIN=$P(CH,"^",6)_$P(CH,"^",7)_$P(CH,"^",8)_$P(CH,"^",9)_$P(CH,"^",10)
 S J=$P(CH,"^",11),H=$P(CH,"^",12),M=$P(CH,"^",13)
 S DEL=((J*24)+H)_"H"_M
 S CLEF=DEB
 F %I=0:0 Q:CLEF>FIN  D TRTK S CLEF=$$ADDAT(CLEF,DEL)
 Q
 
TRTK 
 N CPT,KEY,%X
 S FKEY=CLEF_".001"
 F %X=1E-3:1E-3 S FKEY=CLEF_%X Q:'($D(@GLOECH@("ECH",FKEY)))
 S @GLOECH@("ECH",FKEY,"ACT")=NUMAC
 S @GLOECH@("ACT",NUMAC,"ECH",FKEY)=""
 S @GLOETA@("PLANIFIE",FKEY)=NUMAC
 Q
 
TRT 
 N CLEF,CH,X,I
 S CH=@GLO@(NUMAC,"ECH",NUMFIC)
 F I=1:1:15 S X(I)=$P(CH,"^",I)
 G:X(1)="" ST1
 S CLEF=X(1) F I=1:1:4 S CLEF=CLEF_$S(X(1+I)="":"00",1:X(1+I))
 D TRTK
ST1 G:X(6)="" ST2
 S CLEF=X(6) F I=1:1:4 S CLEF=CLEF_$S(X(6+I)="":"00",1:X(6+I))
 D TRTK
ST2 Q:X(11)=""
 S CLEF=X(11) F I=1:1:4 S CLEF=CLEF_$S(X(11+I)="":"00",1:X(11+I))
 D TRTK
 Q
 
 
 
 
SUPTACH(NUMAC) 
 N NUMFIC,IFIC,GLO,GLOECH,GLOETAT,ECH,%E
 S GLO="^CARGRAC",GLOECH="^CARGECH"
 Q:'($D(@GLOECH@("ACT",NUMAC)))
 S ECH=""
 F %E=0:0 S ECH=$O(@GLOECH@("ACT",NUMAC,"ECH",ECH)) Q:ECH=""  D SUPECH(ECH)
 K @GLOECH@("ACT",NUMAC)
 Q
 
SUPECH(NUMECH) 
 N NUMFIC,IFIC,GLO,GLOECH,GLOETAT,ECH,%E
 S GLO="^CARGRAC",GLOECH="^CARGECH",GLOETA="^CARGETA"
 Q:'($D(@GLOECH@("ECH",NUMECH)))
 K @GLOECH@("ECH",NUMECH)
 F ETAT="PLANIFIE","ATTENTE" K @GLOETA@(ETAT,NUMECH)
 Q
 
 
 
ADDAT(DATE,DELAI) 
 N J,H
 S J=$E(DATE,5,6)_"/"_$E(DATE,3,4)_"/"_$E(DATE,1,2)
 S H=$E(DATE,7,8)_"H"_$E(DATE,9,10)
 S RES=$$ADDAT^%QMDATE(J,H,DELAI)
 S P1=$P(RES,","),P2=$P(RES,",",2)
 Q $P(P1,"/",3)_$P(P1,"/",2)_$P(P1,"/",1)_$P(P2,"H")_$P(P2,"H",2)

