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

;%TXLISL^INT^1^59547,74031^0
%TXLISL ;
 
 
 
 
 S PAG=1,CONT=0,NOM=""
 I '($D(^[QUI]RDVLIBRE(TAD))) S NFIX=0 G PLUS
 S NFIX=1,DX=0,DY=3
 G:SOR=1 LNOM
 N ADRES,CONTR,MEN2
 D CLEBAS^%VVIDEO
 S MEN2=$$CONCAS^%QZCHAD(TEMP,"MENU2")
 S @MEN2@(1)="+^PLUS",@MEN@(1,"EQU")="="
 S @MEN2@(1,"COM")=$$^%QZCHW("Page suivante")
 S @MEN2@(2)="Abandon^FIN"
LNOM 
 S NOM=$O(^[QUI]RDVLIBRE(TAD,NOM)) G:NOM="" QUES
 S PRE=""
LPRE 
 S PRE=$O(^[QUI]RDVLIBRE(TAD,NOM,PRE)) G:PRE="" LNOM
 S OBJ=""
LOBJ 
 S OBJ=$O(^[QUI]RDVLIBRE(TAD,NOM,PRE,OBJ)) G:OBJ="" LPRE
 S COMM=$P(^[QUI]RDVLIBRE(TAD,NOM,PRE,OBJ),"^",2)
 W !,$E(NOM,1,40),?40,COMM G LOBJ
 
QUES 
 I SOR=1 G PLUS
ACT S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(30,80,22,MEN2,.ADRES,.CONTR)
 G:(CONTR="A")!(CONTR="F") FIN
 G:ADRES'="" @ADRES G ACT
 
FIN S CONT=0 Q
PLUS S CONT=1 Q

