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

;%QUBKV2^INT^1^59547,73884^0
%QUBKV2 ;;04:16 PM  31 Jan 1992;
 
 
 
 
SCROLLD(FEN) 
 N LARC,ICO,BOT
 S COLD(FEN)=COLD(FEN)+1,LARC=0,COLG(FEN)=COLD(FEN)
 F ICO=COLD(FEN):-1:1 Q:(LARC+@IN@("LI",ICO,"L"))>LARG(FEN)  Q:ICO<@IN@("FEN",FEN,"D")  S LARC=LARC+@IN@("LI",ICO,"L"),COLG(FEN)=ICO
 S XC=DEBFEN(FEN)
 F ICO=COLG(FEN):1:COLD(FEN)-1 S XC=XC+@IN@("LI",ICO,"L")
 S COLCOUR=COLD(FEN)
 Q
 
SCROLLG(FEN) 
 N LARC,ICO,BOT
 S COLG(FEN)=COLG(FEN)-1,LARC=0,COLD(FEN)=COLG(FEN)
 F ICO=COLG(FEN):1:NBCOL Q:(LARC+@IN@("LI",ICO,"L"))>LARG(FEN)  Q:ICO>@IN@("FEN",FEN,"F")  S LARC=LARC+@IN@("LI",ICO,"L"),COLD(FEN)=ICO
 S XC=DEBFEN(FEN),COLCOUR=COLG(FEN)
 Q
 ;
 ;

