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
;! Nomprog     : RPCUSR                                                       !
;! Module      : RPC (remote procedure call)                                  !
;! But         : RPC pour signer une liste d'ordres avec entrée...            !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;! comme suit: DFN = Patient ORNP = Fournisseur ORL = Emplacement             !
;! ES = Code ES crypté ORWREC (n) = ORIFN; Action ^ Signature Sts             !
;! ^ Libération Sts ^ Nature de l'ordre                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

RPCSYS ;
 QUIT
 ;

DECRYP(S) ;Décrypter la chaîne passée en paramètre
 ;VYD 5/19/95
 N ASSOCIX,IDIX,ASSOCSTR,IDSTR
 Q:$L(S)'>2 "" ;Bad call
 S ASSOCIX=$A($E(S,$L(S)))-31           ;Obtenir l'index de la chaîne associée
 S IDIX=$A($E(S))-31                    ;Obtenir l'index de la chaîne associée
 S ASSOCSTR=$P($T(Z+ASSOCIX),";",3,9)   ;Obtenir la chaîne associée
 S IDSTR=$P($T(Z+IDIX),";",3,9)         ;Obtenir une chaîne d'identificateur
 Q $TR($E(S,2,$L(S)-1),ASSOCSTR,IDSTR)  ;Résultat traduit
 ;
ENCRYP(S) ;RWF 2/5/96
 N %,ASSOCIX,IDIX,ASSOCSTR,IDSTR
 S ASSOCIX=$R(20)+1                     ;Obtenir l'index des associés
 F  S IDIX=$R(20)+1 Q:ASSOCIX'=IDIX     ;Obtenir un index d'identifiant différent
 S ASSOCSTR=$P($T(Z+ASSOCIX),";",3,9)   ;Obtenir la chaîne associée
 S IDSTR=$P($T(Z+IDIX),";",3,9)         ;Obtenir une chaîne d'identificateur
 ;Résultat traduit
 Q $C(IDIX+31)_$TR(S,IDSTR,ASSOCSTR)_$C(ASSOCIX+31)
 ;
SENDKEYS(RESULT) ;Envoyer des clés de cryptage au client
 ;VYD 5/19/95
 N %,X
 S %=1
 F  S X=$P($T(Z+%),";",3,9) Q:X=""  S RESULT(%)=X,%=%+1
 Q
 ;
BLDDRUM Q  ;Ne lancez pas cette étiquette
 N I,%,ALLCHARS,RNDMSTR,CHAR
 X "ZP Z"                      ;Point d'insertion de position
 F I=1:1:20 D
 . S ALLCHARS="" F %=32:1:126 S:$C(%)'="^" ALLCHARS=ALLCHARS_$C(%)
 . S RNDMSTR=""
 . F %=1:1:94 D
 . . S POS=$R($L(ALLCHARS))+1,CHAR=$E(ALLCHARS,POS)
 . . S RNDMSTR=RNDMSTR_CHAR
 . . S ALLCHARS=$P(ALLCHARS,CHAR,1)_$P(ALLCHARS,CHAR,2) ;Compressez par 1
 . X "ZI "" ;;""_RNDMSTR"      ;Enregistrer une chaîne aléatoire dans la routine
 X "ZS"                        ;Enregistrer la routine
 Q

Z ;;
 ;;wkEo-ZJt!dG)49K{nX1BS$vH<&:Myf*>Ae0jQW=;|#PsO`'%+rmb[gpqN,l6/hFC@DcUa ]z~R}"V\iIxu?872.(TYL5_3
 ;;rKv`R;M/9BqAF%&tSs#Vh)dO1DZP> *fX'u[.4lY=-mg_ci802N7LTG<]!CWo:3?{+,5Q}(@jaExn$~p\IyHwzU"|k6Jeb
 ;;\pV(ZJk"WQmCn!Y,y@1d+~8s?[lNMxgHEt=uw|X:qSLjAI*}6zoF{T3#;ca)/h5%`P4$r]G'9e2if_>UDKb7<v0&- RBO.
 ;;depjt3g4W)qD0V~NJar\B "?OYhcu[<Ms%Z`RIL_6:]AX-zG.#}$@vk7/5x&*m;(yb2Fn+l'PwUof1K{9,|EQi>H=CT8S!
 ;;NZW:1}K$byP;jk)7'`x90B|cq@iSsEnu,(l-hf.&Y_?J#R]+voQXU8mrV[!p4tg~OMez CAaGFD6H53%L/dT2<*>"{\wI=
 ;;vCiJ<oZ9|phXVNn)m K`t/SI%]A5qOWe\&?;jT~M!fz1l>[D_0xR32c*4.P"G{r7}E8wUgyudF+6-:B=$(sY,LkbHa#'@Q
 ;;hvMX,'4Ty;[a8/{6l~F_V"}qLI\!@x(D7bRmUH]W15J%N0BYPkrs&9:$)Zj>u|zwQ=ieC-oGA.#?tfdcO3gp`S+En K2*<
 ;;jd!W5[];4'<C$/&x|rZ(k{>?ghBzIFN}fAK"#`p_TqtD*1E37XGVs@0nmSe+Y6Qyo-aUu%i8c=H2vJ\) R:MLb.9,wlO~P
 ;;2ThtjEM+!=xXb)7,ZV{*ci3"8@_l-HS69L>]\AUF/Q%:qD?1~m(yvO0e'<#o$p4dnIzKP|`NrkaGg.ufCRB[; sJYwW}5&
 ;;vB\5/zl-9y:Pj|=(R'7QJI *&CTX"p0]_3.idcuOefVU#omwNZ`$Fs?L+1Sk<,b)hM4A6[Y%aDrg@~KqEW8t>H};n!2xG{
 ;;sFz0Bo@_HfnK>LR}qWXV+D6`Y28=4Cm~G/7-5A\b9!a#rP.l&M$hc3ijQk;),TvUd<[:I"u1'NZSOw]*gxtE{eJp|y (?%
 ;;M@,D}|LJyGO8`$*ZqH .j>c~h<d=fimszv[#-53F!+a;NC'6T91IV?(0x&/{B)w"]Q\YUWprk4:ol%g2nE7teRKbAPuS_X
 ;;.mjY#_0*H<B=Q+FML6]s;r2:e8R}[ic&KA 1w{)vV5d,$u"~xD/Pg?IyfthO@CzWp%!`N4Z'3-(o|J9XUE7k\TlqSb>anG
 ;;xVa1']_GU<X`|\NgM?LS9{"jT%s$}y[nvtlefB2RKJW~(/cIDCPow4,>#zm+:5b@06O3Ap8=*7ZFY!H-uEQk; .q)i&rhd
 ;;I]Jz7AG@QX."%3Lq>METUo{Pp_ |a6<0dYVSv8:b)~W9NK`(r'4fs&wim\kReC2hg=HOj$1B*/nxt,;c#y+![?lFuZ-5D}
 ;;Rr(Ge6F Hx>q$m&C%M~Tn,:"o'tX/*yP.{lZ!YkiVhuw_<KE5a[;}W0gjsz3]@7cI2\QN?f#4p|vb1OUBD9)=-LJA+d`S8
 ;;I~k>y|m};d)-7DZ"Fe/Y<B:xwojR,Vh]O0Sc[`$sg8GXE!1&Qrzp._W%TNK(=J 3i*2abuHA4C'?Mv\Pq{n#56LftUl@9+
 ;;~A*>9 WidFN,1KsmwQ)GJM{I4:C%}#Ep(?HB/r;t.&U8o|l['Lg"2hRDyZ5`nbf]qjc0!zS-TkYO<_=76a\X@$Pe3+xVvu
 ;;yYgjf"5VdHc#uA,W1i+v'6|@pr{n;DJ!8(btPGaQM.LT3oe?NB/&9>Z`-}02*%x<7lsqz4OS ~E$\R]KI[:UwC_=h)kXmF
 ;;5:iar.{YU7mBZR@-K|2 "+~`M%8sq4JhPo<_X\Sg3WC;Tuxz,fvEQ1p9=w}FAI&j/keD0c?)LN6OHV]lGy'$*>nd[(tb!#











