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

;%LXMUV2^INT^1^59547,73871^0
LEXMUVI ;
 
 
 
 
 
 
 
 
VIS1 N RESUL,MNVIS,I,%I,ADR,CTR,CLE1,CLE2,%ABEND,SCR,CHP2
 N CLEDEP,MN,NBCLE
 D CLEPAG^%VVIDEO
 S SCR1="MOTREUAI"
 S MNVIS(1)=$$^%QZCHW("consulter")_"^CONS"
 S MNVIS(2)=$$^%QZCHW("fin")_"^FIN"
 S MNVIS(3)=$$^%QZCHW("synonymes")_"^VSYNO"
 S MNVIS(4)=$$^%QZCHW("mot")_"^MOT"
 S MNAPPLI(1)=$$^%QZCHW("consulter")_"^CONS"
 S MNAPPLI(2)=$$^%QZCHW("fin")_"^FIN"
 S CLE1="",CLE2="",%ABEND=0,SCR=SCR1,MN="MNVIS",NBCLE=2,CLEDEP=1
BOUCINI F I=CLEDEP:1:NBCLE S RESUL(I)=""
 S %ABEND=""
 D AFF1^%VACTGRQ(SCR,.RESUL,.%ABEND)
 G:%ABEND'="" FIN
 I MN="MNVIS" G:'($$SUIVA1) BOUCINI
 I MN'="MNVIS" G:'($$SUIVA2) BOUCINI
BOUC D ^%VAFIGRI,^%VAFISCR
BOUC2 S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(1,80,22,MN,.ADR,.CTR)
 G:CTR="F" FIN
 G:CTR="A" BOUCINI
 I CTR'="" D ^%VSQUEAK G BOUC
 G @ADR
 
CONS S:MN="MNVIS" I=$$SUIVF1
 S:MN'="MNVIS" I=$$SUIVF2
 G BOUC
 
 
 
VSYNO I CLE1="" D ^%VSQUEAK G BOUC
 S NBCLE=2,CLEDEP=2
 S MN="MNAPPLI",SCR="MOTREUY"
 S CHP2=RESUL(2),CHP1=RESUL(1)
 S RESUL(1)=CHP2,CLE1=RESUL(1),CLE2=""
 G BOUCINI
 
FIN Q:MN="MNVIS"
 S RESUL(2)=CHP2
 S RESUL(1)=CHP1
 S NBCLE=2,CLEDEP=1,CLE1=CHP1,CLE2=CHP2
 S MN="MNVIS",SCR="MOTREUAI"
 G BOUC
 
 
MOT I CLE2="" D ^%VSQUEAK G BOUC
 I '($D(^MOTREU(CLE2))) D ^%VSQUEAK G BOUC
 S RESUL(1)=CLE2,LIG=^MOTREU(CLE2)
 F I=2:1:8 S RESUL(I)=$P(LIG,"^",I-1)
 S NBCLE=2,CLEDEP=2
 S SCR="MOTREU"
 D ^%VAFIGRI
 D ^%VAFISCR
 D ^%VZEAVT("")
 S SCR="MOTREUAI"
 S RESUL(1)=CLE1,RESUL(2)=CLE2
 G BOUC
 
 Q
 
 
 
SUIVF1() S CLE2=$O(^MOTREUAI(CLE1,CLE2))
 G:CLE2'="" AFFEC
 S CLE1=$O(^MOTREUAI(CLE1))
 G:CLE1="" ERRSU
 S CLE2=$O(^MOTREUAI(CLE1,""))
 G AFFEC
 
SUIVA1() S CLE1=RESUL(1)
 G:CLE1'="" SUIV12
 S CLE1=$O(^MOTREUAI(""))
 G:CLE1="" ERRSU
 S CLE2=$O(^MOTREUAI(CLE1,""))
 G AFFEC
 
SUIV12 I '($D(^MOTREUAI(CLE1))) S CLE1=$O(^MOTREUAI(CLE1)) G:CLE1="" ERRSU S CLE2=""
 I CLE2="" S CLE2=$O(^MOTREUAI(CLE1,"")) G:CLE2="" ERRSU G AFFEC
 G:$D(^MOTREUAI(CLE1,CLE2)) AFFEC
 S CLE2=$O(^MOTREUAI(CLE1,CLE2))
 G:CLE2="" ERRSU
 G AFFEC
 
 
 
 
SUIVF2() S CLE2=$O(^MOTREUY(CLE1,CLE2))
 G:CLE2="" ERRSU
 G AFFEC2
 
SUIVA2() S CLE2=RESUL(2)
 G:CLE2'="" SUIV22
 S CLE2=$O(^MOTREUY(CLE1,""))
 G:CLE2="" ERRSU
 G AFFEC2
 
SUIV22 I '($D(^MOTREUY(CLE1,CLE2))) S CLE2=$O(^MOTREUY(CLE1,CLE2))
 G:CLE2="" ERRSU
 G AFFEC2
 
 
AFFEC S RESUL(1)=CLE1
 S RESUL(2)=CLE2
 Q 1
 
AFFEC2 S RESUL(2)=CLE2
 Q 1
 
ERRSU D POCLEPA^%VVIDEO
 D ^%VZEAVT($$^%QZCHW("Recherche epuisee..."))
 D POCLEPA^%VVIDEO
 F I=CLEDEP:1:NBCLE S RESUL(I)=""
 Q 0
 ;
 ;
 ;

