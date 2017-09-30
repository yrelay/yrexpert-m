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

;%QS0DPG^INT^1^59547,73879^0
QS0DPG ;
 
 
 
 
TATA 
 K @(TATA) S @TATA="21^10^79"
 S @TATA@(1)=$$^%QZCHW("Intersection")_"^INTER",@TATA@(1,"COM")=$$^%QZCHW("Intersection de listes")
 S @TATA@(2)=$$^%QZCHW("Union")_"^UNION",@TATA@(2,"COM")=$$^%QZCHW("Union de listes")
 S @TATA@(3)=$$^%QZCHW("Valeurs")_"^VALE",@TATA@(3,"COM")=$$^%QZCHW("Extraction des valeurs d'un attribut")
 S @TATA@(4)=$$^%QZCHW("Ordonner")_"^TRI",@TATA@(4,"COM")=$$^%QZCHW("Reclassement des individus")
 S @TATA@(5)=$$^%QZCHW("Duplication")_"^DUPLI",@TATA@(5,"COM")=$$^%QZCHW("Duplication d'une liste sous un autre nom")
 S @TATA@(6)=$$^%QZCHW("Complementaire")_"^COMPL",@TATA@(6,"COM")=$$^%QZCHW("Complementaire d'une liste par rapport a une autre liste")
 S @TATA@(7)=$$^%QZCHW("Manip")_"^MANIP",@TATA@(7,"COM")=$$^%QZCHW("Gestion manuelle d'une liste")
 S @TATA@(8)=$$^%QZCHW("Part")_"^PART",@TATA@(8,"COM")=$$^%QZCHW("Partition d'une liste selon un attribut")
 S @TATA@(9)=$$^%QZCHW("Nettoyage")_"^NETOY",@TATA@(9,"COM")=$$^%QZCHW("Suppression dans les listes des individus inconnus au repertoire")
 Q
 
TUTU 
 K @(TUTU) S @TUTU="21^10^79"
 S @TUTU@(1)=$$^%QZCHW("Entrer")_"^ENTREE",@TUTU@(1,"COM")=$$^%QZCHW("Entrer dans la fenetre")
 S @TUTU@(2)=$$^%QZCHW("Histogramme")_"^GRAPHI",@TUTU@(2,"COM")=$$^%QZCHW("histogramme simple, paralleles, series")
 S @TUTU@(3)=$$^%QZCHW("Autres representations")_"^GRAPH4",@TUTU@(3,"COM")=$$^%QZCHW("Courbes, camemberts,...")
 Q
 
TITI 
 K @(TITI) S @TITI="21^10^79"
 S @TITI@(2)=$$^%QZCHW("Histo. simple")_"^GRAPH1",@TITI@(2,"COM")=$$^%QZCHW("un attribut de totalisation, un attribut de regroupement")
 S @TITI@(3)=$$^%QZCHW("Histo. //")_"^GRAPH2",@TITI@(3,"COM")=$$^%QZCHW("deux attributs de totalisation, un attribut de regroupement")
 S @TITI@(4)=$$^%QZCHW("Histo. serie")_"^GRAPH3",@TITI@(4,"COM")=$$^%QZCHW("un attribut de totalisation, deux attributs de regroupement")
 Q
 
CHOIX(HIS,CONTR) 
 N X,ZZ,%T,ENS,LAR
 S LAR=$S(SUB="C-IBM PC":77,1:79)
 
DEBCH D CLEPAG^%VVIDEO,^%VZEATT
 S ZZ=1,%T=10,%T(1)=12,%T(2)=12,%T(3)=11,%T(4)=11,%T(5)=11,%T(6)=11,%T(7)=2,%T(8)=2,%T(9)=2,%T(10)=2
 D CONSTAB(ZZ,"%T")
 S X=$$INI^%QUCHOI4(1,"",0,2,LAR,19,"",ZZ,0)
 G CHOIX2
FIN D CLEPAG^%VVIDEO,END^%QUCHOI4(ZZ)
 K ^[QUI]QX($J),@(TEMP)
 Q
 
CHOIX2 
 D TIT,AFF^%QUCHOI4(ZZ)
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MENUH=$$CONCAS^%QZCHAD(TEMP,"MENUH")
 S ENS=$$CONCAS^%QZCHAD(TEMP,"ENS")
 S @MENUH="21^10^79"
 S @MENUH@(1)=$$^%QZCHW("Visualiser")_"^VISUH",@MENUH@(1,"COM")=$$^%QZCHW("Visualisation d'un histogramme existant")
 S @MENUH@(2)=$$^%QZCHW("Supprimer")_"^SUPPH",@MENUH@(2,"COM")=$$^%QZCHW("Suppression d'un histogramme")
 S @MENUH@(3)=$$^%QZCHW("Creer")_"^CREAH",@MENUH@(3,"COM")=$$^%QZCHW("Creation d'un nouvel histogramme")
ACTH S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(1,79,22,MENUH,.ADRES,.CONTR) G:(CONTR="F")!(CONTR="A") FIN
 G:ADRES'="" @ADRES G ACTH
VISUH 
 S X=$$UN^%QUCHOI4(ZZ) G:X="" ACTH
 S X=^[QUI]QX($J,ZZ,"R",X)
 S HIS=^[QUI]QX($J,ZZ,"T",X,1)
 G FIN
SUPPH 
 D ^%QUCHOYP(ENS) G:'($D(@ENS)) ACTH
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de ces histogrammes ? "))'=1 G ACTH
 S HIS=""
 F %T=1:1 S HIS=$O(@ENS@(HIS)) Q:HIS=""  D SUP^%HXIHITU(^[QUI]QX($J,ZZ,"T",^[QUI]QX($J,ZZ,"R",HIS),1))
 
 G DEBCH
CREAH 
 S HIS=1 G FIN
 
TIT 
 S DX=0,DY=0 X XY D REV^%VVIDEO
 X XY W $J("",2),"HISTOGRAMME",$J("",4)_"LISTE",$J("",10)_"ORDONNEES"_$J("",11)_"ABSCISSES"_$J("",9)_"ABC"_$J("",1)_"OPT "
 S DY=1 X XY W $J("",31),"1",$J("",9),"2",$J("",9),"1",$J("",9),"2",$J("",8),"1 2 1 2 "
 X XY D NORM^%VVIDEO Q
 
CONSTAB(P,DIM) 
 
 
 
 N %C,%V,ATT,COMP,I,CLE,K,STOP,TYP,V,VAL,ADR
 K ^[QUI]QX($J),^QX($J)
 F I=1:1:@DIM S ^[QUI]QX($J,P,"LC",I)=@DIM@(I)
 S ADR=$$ADRHIS^%HXIHITU,J=1,HIS=""
 F I=1:1 S HIS=$O(@ADR@(HIS)) Q:HIS=""  D INSG
 Q
INSG 
 S ^[QUI]QX($J,P,"T",J,1)=HIS
 F K=2:1:@DIM-2 S ATT=$P($P($T(LIB),";;",2),"/",K-1),^[QUI]QX($J,P,"T",J,K)=$S($D(@ADR@(HIS,"PAR",ATT)):@ADR@(HIS,"PAR",ATT),1:"")
 S ATT=$P($P($T(LIB),";;",2),"/",8),^[QUI]QX($J,P,"T",J,9)=$S('($D(@ADR@(HIS,"PAR",ATT))):"T",@ADR@(HIS,"PAR",ATT)=1:"T",1:"M")
 S ATT=$P($P($T(LIB),";;",2),"/",9),^[QUI]QX($J,P,"T",J,10)=$S('($D(@ADR@(HIS,"PAR",ATT))):$S(@ADR@(HIS,"TYPE")=1:"",1:"T"),@ADR@(HIS,"PAR",ATT)=1:"T",1:"M")
 S J=J+1 Q
LIB ;;LISTE/TOT1/TOT2/REG1/REG2/ABC/ABC2/OPT/OPT2

