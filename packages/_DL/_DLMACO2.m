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

;%DLMACO2^INT^1^59547,73868^0
DLMACO2 ;
 
 
 
 
 
COHER K @(GLOERR)
 S CERR=1,DY=23,MAC=""
 S CONT="S DX=0,DY=DY+1 I DY>23 S DY=3 D CLEBAS^%VVIDEO"
 X CONT
BMACH S MAC=$O(^[QUI]DESMACH(MAC))
 G:MAC="" VISU
 X XY W MAC
 X CONT
 S VERS=$O(^[QUI]DESMACH(MAC,""))
 I $O(^[QUI]DESMACH(MAC,VERS))'="" D MERR("  "_$$^%QZCHW("La machine")_" "_MAC_" "_$$^%QZCHW("apparait plusieurs fois, pour des sections differentes"))
 S JOUR=""
BMACO1 S JOUR=$O(^[QUI]MACOP(MAC,JOUR))
 G:JOUR="" BMACA1
 I $L(JOUR,"/")'=3 D MERR("  "_$$^%QZCHW("Format de date incorrect pour la machine")_" "_MAC_", "_$$^%QZCHW("le")_" "_JOUR)
 I '($D(^[QUI]MACAP(MAC,JOUR))) D MERR("  "_$$^%QZCHW("Certains stades sont decrits pour la machine")_" "_MAC_", "_$$^%QZCHW("le")_" "_JOUR_", "_$$^%QZCHW("mais n'apparaissent pas au niveau de la description des charges")) G BMACO1
 S CHA=$P(^[QUI]MACAP(MAC,JOUR),"^",2)
 S CUMCHA=0
 S LAN=""
BMACO2 S LAN=$O(^[QUI]MACOP(MAC,JOUR,LAN))
 G:LAN="" BMACO3
 S I=""
BMACO21 S I=$O(^[QUI]MACOP(MAC,JOUR,LAN,I))
 G:I="" BMACO2
 S OP=""
BMACO22 S OP=$O(^[QUI]MACOP(MAC,JOUR,LAN,I,OP))
 G:OP="" BMACO21
 S CUMCHA=CUMCHA+$P(^[QUI]MACOP(MAC,JOUR,LAN,I,OP),"^")
 G BMACO22
 
BMACO3 G:CUMCHA=CHA BMACO1
 D MERR("  "_$$^%QZCHW("Machine")_" "_MAC_", "_$$^%QZCHW("le")_" "_JOUR_" : "_$$^%QZCHW("la somme des charges apparaissant au niveau de la description des stades n'est pas egale a celle declaree")_" : "_CUMCHA_" "_$$^%QZXHW("pour")_" "_CHA)
 G BMACO1
 
BMACA1 S JOUR=$O(^[QUI]MACAP(MAC,JOUR))
 G:JOUR="" BMACH
 G:$D(^[QUI]MACOP(MAC,JOUR)) BMACA1
 I $L(JOUR,"/")'=3 D MERR("  "_$$^%QZCHW("Format de date incorrect pour la machine")_" "_MAC_", "_$$^%QZCHW("le")_" "_JOUR)
 S CHA=$P(^[QUI]MACAP(MAC,JOUR),"^",2)+0
 G:CHA=0 BMACA1
 D MERR($$^%QZCHW("Machine")_" "_MAC_", "_$$^%QZCHW("le")_" "_JOUR_" : "_$$^%QZCHW("la description des stades correspondant a la charge declaree est inexistante"))
 G BMACA1
 
VISU S:CERR=1 @GLOERR@(1)="     "_$$^%QZCHW("Pas d'incoherence")
 
RESUL S:'($D(@GLOERR)) @GLOERR@(1)="   "_$$^%QZCHW("Coherence non activee")
 D AFFERR^%QULIMZ(GLOERR,$$^%QZCHW("RESULTATS DE LA COHERENCE"))
 G MENU^%DLMACO1
 
MERR(MES) 
 S @GLOERR@(CERR)=MES
 S CERR=CERR+1
 X XY W MES
 X CONT
 Q

