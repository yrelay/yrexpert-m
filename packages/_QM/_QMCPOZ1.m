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

;%QMCPOZ1^INT^1^59547,73876^0
QMCPOZ1 ;
 
 
 
 
 
 
 
 
 
SUP(SUP,IO,STOP,REAFF) 
 N TEMP,MEN,ADR,CTR,DX,DY,HOST
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MEN")
 K @(TEMP)
 S HOST=$$TABID^%INCOIN("ORDINATEUR")
 S STOP=0
 
 I HOST="IBM-PC" D FIC Q
 
 I HOST="PDP" D BDE Q
 
 D MEN(MEN)
 D ^%VQUIKMN(0,79,22,MEN,.ADR,.CTR)
 I CTR="A" S STOP=1 Q
 D @ADR
 K @(TEMP)
 Q
FIN K @(TEMP) Q
FIC S SUP="FILE"
 S DX=0,DY=5
 D LIRE2^%VREAD($$^%QZCHW("nom du fichier")_" : ","",1,RM-1,DY+1,DY-1,REAFF,"",.CTR,.IO)
 I (IO="")!(CTR="A") D FIN S STOP=1 Q
 Q
BDE S SUP="TAPE"
 S DX=0,DY=5
 D LIRE2^%VREAD($$^%QZCHW("numero du derouleur de bande")_" : ",47,1,RM-1,DY+1,DY-1,REAFF,"$$UC1^%QMCP4",.CTR,.IO)
 I (IO="")!(CTR="A") D FIN S STOP=1 Q
 Q
MEN(MEN) 
 S @MEN@(1)=$$^%QZCHW("Fichier")_"^"_"FIC"
 S @MEN@(1,"COM")=$$^%QZCHW("le support de la sauvegarde est un Fichier")
 S @MEN@(2)=$$^%QZCHW("Bande")_"^"_"BDE"
 S @MEN@(2,"COM")=$$^%QZCHW("le support de la sauvegarde est une bande")
 Q

