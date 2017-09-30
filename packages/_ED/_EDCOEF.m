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

;%EDCOEF^INT^1^59547,73869^0
EDCOEF ;
 
 
 
 
 
 
 
 
 N OR,POL
 S OR=$$^%QCAZG("^V($J,""%"",""%ORIENTATION"",1)") S:OR="" OR="VERTICALE"
 S %MARGE=$S(OR="HORIZONTALE":285E-1,1:20)
 S POL=^V($J,"%","%TAILLE",1)
 I (POL=0)!(POL>36) S POL=1
 G @POL
1 S %COEF=25E-2,%COEF2=25E-2 Q
2 S %COEF=23E-2,%COEF2=14E-2 Q
3 S %COEF=21E-2,%COEF2=135E-3 Q
4 S %COEF=20E-2,%COEF2=13E-2 Q
5 S %COEF=19E-2,%COEF2=12E-2 Q
6 S %COEF=21E-2,%COEF2=21E-2 Q
7 S %COEF=155E-3,%COEF2=155E-3 Q
8 G 6
9 G 6
10 S %COEF=29E-2,%COEF2=23E-2 Q
11 S %COEF=26E-2,%COEF2=20E-2 Q
12 S %COEF=21E-2,%COEF2=16E-2 Q
13 S %COEF=17E-2,%COEF2=12E-2 Q
14 S %COEF=13E-2,%COEF2=10E-2 Q
15 G 7
16 S %COEF=12E-2,%COEF2=12E-2 Q
17 G 1
18 G 1
19 G 2
20 G 3
21 G 4
22 G 5
23 G 6
24 G 6
25 G 7
26 G 6
27 G 6
28 G 6
29 G 10
30 G 11
31 G 12
32 G 13
33 G 14
34 G 15
35 G 15
36 G 16

