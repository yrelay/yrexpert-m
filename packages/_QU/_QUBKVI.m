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

;%QUBKVI^INT^1^59547,73884^0
%QUBKVI(IN,A,REF) ;;05:23 PM  18 Feb 1992;
 
 
 
 
 
 N %F,BUF,COL,I,J,L,LC,LD,LF,SX,SY,V,X,X1,Y,NC,PA,NP,CGEN,VID
 N NBFIX,LGFIX,LGSCR,YBAS,LIGWB,LIGWH,LAR,MAXOU,IFEN,VUE,AC,NUMUC,IM
 N FINEXE,TEMP,MENUH,TITRE,ADRES,CONTR,TABLES,VARIAS
 
 
 
 N NBFEN,NBLIFEN,COLCOUR,LIGCOUR,FENCOUR,XC,YC,OK,REAF,NBCOL,IFI,ILIG
 
 N DEBFEN,LARG,COLG,COLD
 
 S TEMP=$$TEMP^%SGUTIL
 S MENUH=$$CONCAS^%QZCHAD(TEMP,"MN")
 S TABLES=$$CONCAS^%QZCHAD(TEMP,"TB")
 S VARIAS=$$CONCAS^%QZCHAD(TEMP,"VA")
 
 
 D:'($D(PK)) INIT^%PKDEV
 S NBCOL=$ZP(@IN@("LI","")),NBLIFEN=@IN@("H")-5
 S YBAS=(@IN@("Y")+@IN@("H"))-2,TITRE=$S($D(@IN@("TI")):@IN@("TI"),1:"")
 S LIGWH=1,LIGWB=$S($D(@A@(NBLIFEN)):NBLIFEN,1:$ZP(@A@("")))
 S AC=@IN@("X")+2 F IFEN=1:1 Q:'($D(@IN@("FEN",IFEN)))  S LARG(IFEN)=@IN@("FEN",IFEN,"L") D INITFEN
 S NBFEN=IFEN-1
 S LIGCOUR=1,COLCOUR=1
 F FENCOUR=1:1 G:'($D(LARG(FENCOUR))) QUE0 I LARG(FENCOUR)'=0 S XC=DEBFEN(FENCOUR),COLCOUR=COLG(FENCOUR) Q
 
QUE0 S YC=@IN@("Y")+3
 F I="DEBFEN","COLG","COLD","LARG" S J="" F %J=0:0 S J=$O(@I@(J)) Q:J=""  S @TABLES@(I,J)=@I@(J)
 F I="NBLIFEN","LIGCOUR","COLCOUR","FENCOUR","NBFEN","YBAS","LIGWH","LIGWB","A","NBCOL","XC","YC","IN","REF" I $D(@I) S @VARIAS@(I)=@I
 Q TEMP
 
 
END(TEMP) K @(TEMP) Q
 
 
INITFEN N LSTCOL,VUE
 Q:LARG(IFEN)=0
 S DEBFEN(IFEN)=AC,AC=(AC+LARG(IFEN))+1
 S COLG(IFEN)=@IN@("FEN",IFEN,"D"),LAR=0
 S VUE=0 F LSTCOL=COLG(IFEN):1 S LAR=LAR+@IN@("LI",LSTCOL,"L"),VUE=LAR>LARG(IFEN) Q:VUE  Q:LSTCOL=@IN@("FEN",IFEN,"F")
 S COLD(IFEN)=LSTCOL-VUE
 Q
 ;

